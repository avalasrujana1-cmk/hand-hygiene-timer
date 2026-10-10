`timescale 1ns/1ps
// Self-checking testbench for the hand-hygiene timer.
// One "second" = 8 clocks (TICK_DIV), debounce = 4 clocks (DEB_W = 2).
module tb_top;
    localparam TICK_DIV = 8;
    localparam SEC      = TICK_DIV;          // clocks per second

    reg        clk = 0;
    reg        rst_n;
    reg        sensor_in;
    reg  [1:0] mode_sel;
    reg        clear_log;
    wire [2:0] led_progress;
    wire       led_done, buzzer, alarm_short;
    wire [7:0] good_cnt, bad_cnt;

    top #(.TICK_DIV(TICK_DIV), .TICK_W(4), .DEB_W(2)) dut (
        .clk(clk), .rst_n(rst_n), .sensor_in(sensor_in),
        .mode_sel(mode_sel), .clear_log(clear_log),
        .led_progress(led_progress), .led_done(led_done),
        .buzzer(buzzer), .alarm_short(alarm_short),
        .good_cnt(good_cnt), .bad_cnt(bad_cnt)
    );

    always #5 clk = ~clk;                    // 100 MHz in simulation

    integer pass_n = 0;
    integer fail_n = 0;

    task check(input cond, input [255:0] name);
        begin
            if (cond) begin
                pass_n = pass_n + 1;
                $display("PASS: %0s", name);
            end else begin
                fail_n = fail_n + 1;
                $display("FAIL: %0s  (t=%0t good=%0d bad=%0d done=%b short=%b)",
                         name, $time, good_cnt, bad_cnt, led_done, alarm_short);
            end
        end
    endtask

    task wait_clks(input integer n);
        begin repeat (n) @(posedge clk); end
    endtask

    task wait_secs(input integer s);
        begin wait_clks(s * SEC); end
    endtask

    task do_reset;
        begin
            rst_n = 0; sensor_in = 0; clear_log = 0; mode_sel = 2'b00;
            wait_clks(3);
            rst_n = 1;
            wait_clks(3);
        end
    endtask

    // Bring the design back to IDLE between tests (sensor low, wait out indication)
    task settle;
        begin
            sensor_in = 0;
            wait_secs(5);
        end
    endtask

    // Safety assertion: done and short never together; counters never fall
    reg [7:0] prev_good = 0, prev_bad = 0;
    reg       clear_seen = 0;
    always @(posedge clk) begin
        if (led_done && alarm_short) begin
            fail_n = fail_n + 1;
            $display("FAIL: done and short both high at %0t", $time);
        end
        if (rst_n && !clear_log && !clear_seen &&
            (good_cnt < prev_good || bad_cnt < prev_bad)) begin
            fail_n = fail_n + 1;
            $display("FAIL: counter decreased at %0t", $time);
        end
        clear_seen <= clear_log;
        prev_good  <= good_cnt;
        prev_bad   <= bad_cnt;
    end

    reg [7:0] g0, b0;

    initial begin
        $dumpfile("test/tb_top.vcd");
        $dumpvars(0, tb_top);

        // ---- Test 1: reset values
        do_reset;
        check(good_cnt == 0 && bad_cnt == 0 && !led_done && !alarm_short,
              "T1 reset state clean");

        // ---- Test 2: full 20 s wash, mode 00
        g0 = good_cnt; b0 = bad_cnt;
        sensor_in = 1;
        wait_secs(23);
        check(good_cnt == g0 + 1 && bad_cnt == b0, "T2 full wash counts good");
        settle;

        // ---- Test 3: too-short wash (leave at 8 s, stay away past grace)
        g0 = good_cnt; b0 = bad_cnt;
        sensor_in = 1;
        wait_secs(8);
        sensor_in = 0;
        wait_secs(5);
        check(bad_cnt == b0 + 1 && good_cnt == g0, "T3 short wash counts bad");
        settle;

        // ---- Test 4: dropout shorter than grace, wash must still pass
        g0 = good_cnt; b0 = bad_cnt;
        sensor_in = 1;
        wait_secs(8);
        sensor_in = 0;
        wait_clks(6);                         // well under 2 s grace, above debounce
        sensor_in = 1;
        wait_secs(16);
        check(good_cnt == g0 + 1 && bad_cnt == b0, "T4 brief dropout tolerated");
        settle;

        // ---- Test 5: sensor glitch (1-2 clocks) is ignored
        g0 = good_cnt; b0 = bad_cnt;
        sensor_in = 1; wait_clks(2); sensor_in = 0;
        wait_secs(3);
        check(good_cnt == g0 && bad_cnt == b0 && led_progress == 3'b000,
              "T5 glitch ignored");

        // ---- Test 6: mode 01 (30 s)
        g0 = good_cnt;
        mode_sel = 2'b01;
        sensor_in = 1;
        wait_secs(25);
        check(good_cnt == g0, "T6a 30s mode not done at 25 s");
        wait_secs(8);
        check(good_cnt == g0 + 1, "T6b 30s mode done after 30 s");
        settle;

        // ---- Test 7: mode 10 (40 s)
        g0 = good_cnt;
        mode_sel = 2'b10;
        sensor_in = 1;
        wait_secs(35);
        check(good_cnt == g0, "T7a 40s mode not done at 35 s");
        wait_secs(8);
        check(good_cnt == g0 + 1, "T7b 40s mode done after 40 s");
        settle;

        // ---- Test 8: mode change mid-wash has no effect (latched)
        g0 = good_cnt;
        mode_sel = 2'b00;
        sensor_in = 1;
        wait_secs(5);
        mode_sel = 2'b10;                     // try to extend to 40 s
        wait_secs(18);
        check(good_cnt == g0 + 1, "T8 mode latched at wash start");
        settle;
        mode_sel = 2'b00;

        // ---- Test 9: progress LEDs rise in thirds
        sensor_in = 1;
        wait_secs(8);
        check(led_progress == 3'b001, "T9a progress 1/3");
        wait_secs(6);
        check(led_progress == 3'b011, "T9b progress 2/3");
        wait_secs(8);
        settle;

        // ---- Test 10: reset in the middle of a wash
        sensor_in = 1;
        wait_secs(6);
        rst_n = 0; wait_clks(2); rst_n = 1;
        sensor_in = 0;
        wait_secs(3);
        check(good_cnt == 0 && bad_cnt == 0 && led_progress == 3'b000,
              "T10 reset mid-wash clears everything");

        // ---- Test 11: clear_log
        sensor_in = 1; wait_secs(23); settle;
        check(good_cnt != 0, "T11a good count nonzero before clear");
        clear_log = 1; wait_clks(2); clear_log = 0;
        wait_clks(2);
        check(good_cnt == 0 && bad_cnt == 0, "T11b clear_log zeroes counters");

        // ---- Test 12: back-to-back washes count once each
        g0 = good_cnt;
        sensor_in = 1; wait_secs(23);
        sensor_in = 0; wait_secs(5);
        sensor_in = 1; wait_secs(23);
        sensor_in = 0; wait_secs(5);
        check(good_cnt == g0 + 2, "T12 two washes counted exactly twice");

        $display("--------------------------------------");
        $display("RESULT: %0d passed, %0d failed", pass_n, fail_n);
        if (fail_n == 0) $display("ALL TESTS PASSED");
        else             $display("SOME TESTS FAILED");
        $finish;
    end

    // Watchdog so a hang never runs forever
    initial begin
        #50_000_000;
        $display("FAIL: simulation timeout");
        $finish;
    end
endmodule