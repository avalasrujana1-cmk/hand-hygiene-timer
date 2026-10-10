// Tick generator: produces a 1-cycle-wide enable pulse every DIV clocks.
// Uses an enable pulse, not a divided clock, so there is one clock domain.
module tick_gen #(
    parameter DIV = 32768,        // clocks per tick (use a small value in simulation)
    parameter W   = 15            // counter width, must satisfy 2**W >= DIV
) (
    input  wire clk,
    input  wire rst_n,
    input  wire clear,            // restarts the count (used when a wash begins)
    output reg  tick
);
        localparam [W-1:0] LAST = W'(DIV - 1);
    reg [W-1:0] cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt  <= {W{1'b0}};
            tick <= 1'b0;
        end else if (clear) begin
            cnt  <= {W{1'b0}};
            tick <= 1'b0;
         end else if (cnt == LAST) begin
            cnt  <= {W{1'b0}};
            tick <= 1'b1;
        end else begin
            cnt  <= cnt + 1'b1;
            tick <= 1'b0;
        end
    end
endmodule
