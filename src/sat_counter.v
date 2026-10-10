// Saturating counter: counts up on inc, holds at max value, clears on clear.
module sat_counter #(
    parameter W = 8
) (
    input  wire         clk,
    input  wire         rst_n,
    input  wire         clear,
    input  wire         inc,
    output reg  [W-1:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            count <= {W{1'b0}};
        else if (clear)
            count <= {W{1'b0}};
        else if (inc && (count != {W{1'b1}}))
            count <= count + 1'b1;
    end
endmodule
