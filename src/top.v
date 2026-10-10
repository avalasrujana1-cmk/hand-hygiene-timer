// Top level: Hand-Hygiene Compliance Timer
module top #(
    parameter TICK_DIV = 32768,   // clocks per second (small value in simulation)
    parameter TICK_W   = 15,      // counter width, 2**TICK_W >= TICK_DIV
    parameter DEB_W    = 11       // debounce width: 2**DEB_W clocks
) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       sensor_in,
    input  wire [1:0] mode_sel,
    input  wire       clear_log,
    output wire [2:0] led_progress,
    output wire       led_done,
    output wire       buzzer,
    output wire       alarm_short,
    output wire [7:0] good_cnt,
    output wire [7:0] bad_cnt
);
    wire sensor_sync;
    wire sensor_clean;
    wire tick;
    wire tick_clear;
    wire good_inc;
    wire bad_inc;

    synchronizer u_sync (
        .clk      (clk),
        .rst_n    (rst_n),
        .async_in (sensor_in),
        .sync_out (sensor_sync)
    );

    debounce #(.WIDTH(DEB_W)) u_deb (
        .clk   (clk),
        .rst_n (rst_n),
        .in    (sensor_sync),
        .out   (sensor_clean)
    );

    tick_gen #(.DIV(TICK_DIV), .W(TICK_W)) u_tick (
        .clk   (clk),
        .rst_n (rst_n),
        .clear (tick_clear),
        .tick  (tick)
    );

    wash_fsm u_fsm (
        .clk          (clk),
        .rst_n        (rst_n),
        .sensor       (sensor_clean),
        .tick         (tick),
        .mode_sel     (mode_sel),
        .tick_clear   (tick_clear),
        .led_progress (led_progress),
        .led_done     (led_done),
        .alarm_short  (alarm_short),
        .buzzer       (buzzer),
        .good_inc     (good_inc),
        .bad_inc      (bad_inc)
    );

    sat_counter #(.W(8)) u_good (
        .clk   (clk),
        .rst_n (rst_n),
        .clear (clear_log),
        .inc   (good_inc),
        .count (good_cnt)
    );

    sat_counter #(.W(8)) u_bad (
        .clk   (clk),
        .rst_n (rst_n),
        .clear (clear_log),
        .inc   (bad_inc),
        .count (bad_cnt)
    );
endmodule
