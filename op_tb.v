

`include "op.v"
`timescale 1ns/1ps
module tb_multi_edge_clk;

    reg clk;
    reg [7:0] a, b, d;
    wire [7:0] c, f;

    // Instantiate DUT
    multi_edge_clk uut (
        .a(a),
        .b(b),
        .d(d),
        .f(f),
        .clk(clk),
        .c(c)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;   // toggle clock every 5 ns
    end

    // Stimulus
    initial begin
        // Initialize inputs
        a = 8'd0; b = 8'd0; d = 8'd0;

        // Apply test vectors
        #10 a = 8'd15; b = 8'd10; d = 8'd5;    // Expect c=25 (posedge), f=20 (negedge)
        #20 a = 8'd20; b = 8'd30; d = 8'd8;    // Expect c=50, f=42
        #20 a = 8'd5;  b = 8'd2;  d = 8'd1;    // Expect c=7,  f=6
        #20 a = 8'd100; b = 8'd50; d = 8'd20;  // Expect c=150, f=130

        // Finish simulation
        #50 $finish;
    end

    // Monitor in terminal
    initial begin
        $monitor("Time=%0t | a=%d b=%d c=%d d=%d f=%d",
                  $time, a, b, c, d, f);
    end

    // Dump signals for GTKWave
    initial begin
        $dumpfile("multi_edge_clk.vcd");     // VCD file name
        $dumpvars(0, tb_multi_edge_clk);     // dump all signals in tb
    end

endmodule
