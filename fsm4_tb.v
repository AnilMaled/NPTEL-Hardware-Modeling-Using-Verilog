`timescale 1ns/1ps
`include "fsm4.v"




module tb_fsm4;
    reg clk, reset, in;
    wire z;
    wire [3:0] count;

    fsm4 uut (
        .in(in),
        .clk(clk),
        .reset(reset),
        .z(z)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("fsm4_tb.vcd");
        $dumpvars(0, tb_fsm4);

        clk = 0; reset = 1; in = 0;
        #10 reset = 0; 
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;  // detect (count=1)

        #10 in = 1;
        #10 in = 1;
        #10 in = 0;  // detect again (count=2)

        #10 in = 1;
        #10 in = 0;  // no detection yet
        #10 in = 1;
        #10 in = 0;  // no "110" here

        #20 $finish;
    end
endmodule
