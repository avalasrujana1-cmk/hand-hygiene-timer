// Debounce: output changes only after the input has been
// stable for 2^WIDTH clock cycles
module debounce #(
    parameter WIDTH = 11          // 2^11 = 2048 clocks (~62 ms at 32.768 kHz)
) (
    input  wire clk,
    input  wire rst_n,
    input  wire in,
    output reg  out
);
    reg [WIDTH-1:0] cnt;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= {WIDTH{1'b0}};
            out <= 1'b0;
        end else if (in == out) begin
            cnt <= {WIDTH{1'b0}};          // no change pending
        end else begin
            cnt <= cnt + 1'b1;             // input differs, count how long
            if (&cnt) begin                // counter full: input stable long enough
                out <= in;
                cnt <= {WIDTH{1'b0}};
            end
        end
    end
endmodule
