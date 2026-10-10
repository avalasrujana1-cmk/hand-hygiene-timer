// 2-FF synchronizer: brings an asynchronous input into the clk domain
module synchronizer (
    input  wire clk,
    input  wire rst_n,
    input  wire async_in,
    output wire sync_out
);
    reg ff1, ff2;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ff1 <= 1'b0;
            ff2 <= 1'b0;
        end else begin
            ff1 <= async_in;   // may go metastable
            ff2 <= ff1;        // gets a full cycle to settle
        end
    end

    assign sync_out = ff2;
endmodule
