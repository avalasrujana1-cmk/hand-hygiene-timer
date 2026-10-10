// Wash FSM: times a hand wash, tolerates short dropouts, reports result.
module wash_fsm #(
    parameter [5:0] GRACE_S = 6'd2,   // allowed sensor dropout (seconds)
    parameter [5:0] BEEP_S  = 6'd2    // result indication time (seconds)
) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       sensor,         // debounced hands-present signal
    input  wire       tick,           // 1-cycle pulse once per second
    input  wire [1:0] mode_sel,
    output wire       tick_clear,
    output reg  [2:0] led_progress,
    output wire       led_done,
    output wire       alarm_short,
    output wire       buzzer,
    output reg        good_inc,
    output reg        bad_inc
);
    localparam [2:0] IDLE       = 3'd0,
                     WASHING    = 3'd1,
                     PAUSED     = 3'd2,
                     DONE_OK    = 3'd3,
                     DONE_SHORT = 3'd4,
                     COOLDOWN   = 3'd5;

    reg [2:0] state;
    reg [1:0] mode_r;                 // mode latched at wash start
    reg [5:0] secs;                   // seconds washed
    reg [5:0] aux;                    // grace / indication timer

    // Target and progress thresholds for the latched mode
    reg [5:0] target, t1, t2;
    always @* begin
        case (mode_r)
            2'b01:   begin target = 6'd30; t1 = 6'd10; t2 = 6'd20; end
            2'b10:   begin target = 6'd40; t1 = 6'd13; t2 = 6'd26; end
            default: begin target = 6'd20; t1 = 6'd6;  t2 = 6'd13; end
        endcase
    end

    // State register and timers
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state    <= IDLE;
            mode_r   <= 2'b00;
            secs     <= 6'd0;
            aux      <= 6'd0;
            good_inc <= 1'b0;
            bad_inc  <= 1'b0;
        end else begin
            good_inc <= 1'b0;
            bad_inc  <= 1'b0;
            case (state)
                IDLE: begin
                    secs <= 6'd0;
                    aux  <= 6'd0;
                    if (sensor) begin
                        mode_r <= mode_sel;
                        state  <= WASHING;
                    end
                end

                WASHING: begin
                    if (!sensor) begin
                        aux   <= 6'd0;
                        state <= PAUSED;
                    end else if (secs >= target) begin
                        aux      <= 6'd0;
                        good_inc <= 1'b1;
                        state    <= DONE_OK;
                    end else if (tick) begin
                        secs <= secs + 6'd1;
                    end
                end

                PAUSED: begin
                    if (sensor) begin
                        state <= WASHING;
                    end else if (tick) begin
                        if ((aux + 6'd1) >= GRACE_S) begin
                            aux     <= 6'd0;
                            bad_inc <= 1'b1;
                            state   <= DONE_SHORT;
                        end else begin
                            aux <= aux + 6'd1;
                        end
                    end
                end

                DONE_OK, DONE_SHORT: begin
                    if (tick) begin
                        if ((aux + 6'd1) >= BEEP_S) state <= COOLDOWN;
                        else                        aux   <= aux + 6'd1;
                    end
                end

                COOLDOWN: begin
                    if (!sensor) state <= IDLE;
                end

                default: state <= IDLE;
            endcase
        end
    end

    // Outputs
    assign tick_clear  = (state == IDLE);
    assign led_done    = (state == DONE_OK);
    assign alarm_short = (state == DONE_SHORT);
    assign buzzer      = (state == DONE_OK) || (state == DONE_SHORT);

    always @* begin
        if (state == IDLE || state == COOLDOWN)
            led_progress = 3'b000;
        else
            led_progress = {(secs >= target), (secs >= t2), (secs >= t1)};
    end
endmodule
