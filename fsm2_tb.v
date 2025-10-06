`timescale 1ns/1ps
`include "fsm2.v"

module tb_lrg;
    reg clk;
    wire [2:0] light;

    lrg uut (
        .clk(clk),
        .light(light)
    );

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end


    initial begin
     
        $dumpfile("lrg.vcd");
        $dumpvars(0, tb_lrg);

        
        #100 $finish;
    end

endmodule
