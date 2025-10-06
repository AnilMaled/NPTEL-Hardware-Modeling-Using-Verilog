`timescale 1ns/1ps
`include "fsm3.v"

module tb_parity_gen;
    reg clk;
    reg x;
    wire z;


    parity uut (

        .x(x),
        .clk(clk),
        .z(z)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;   
    end

    initial begin 
        $dumpfile("parity_gen.vcd");
        $dumpvars(0, tb_parity_gen);
        $display("Time\tclk\tx\tz");
        $monitor("%0t\t%b\t%b\t%b", $time, clk, x, z);
       #2 x = 0;  #10;  //#2 will make input stable befoure clock  edge comes
    
        x = 1;  #10;
        x = 0;  #10;
        x = 1;  #10;
        x = 1;  #10;
        x = 0;  #10;   $finish;   

    end
endmodule
