`timescale 1ns/1ps
`include "fsm5.v"

module tb_S_adder;
    reg a, b, clk, reset;
    wire s;

    S_adder uut(.a(a), .b(b), .clk(clk), .reset(reset), .s(s));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("S_adder_fsm_tb.vcd");
        $dumpvars(0, tb_S_adder);

        clk = 0; reset = 1; a = 0; b = 0;
        #10 reset = 0;

        
        a = 1; b = 1; #10;  // 1+1=0, carry=1
        a = 1; b = 0; #10;  // 1+0+1=0, carry=1
        a = 0; b = 1; #10;  // 0+1+1=0, carry=1
        a = 1; b = 1; #10;  // 1+1+1=1, carry=1
        a = 0; b = 0; #10;  // last cycle, carry=1 → sum=1

        #20 $finish;
    end
endmodule

