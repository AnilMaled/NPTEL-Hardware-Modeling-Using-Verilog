// Code your design here
// Another example
module multi_edge_clk (a, b,d,c, f, clk);
    input clk;
    input [7:0] a, b, d;
    output reg [7:0]c;
    output reg [7:0]f;
   
    always @(posedge clk)
        c <= a + b;

    always @(negedge clk)
        f <= c - d;

endmodule
