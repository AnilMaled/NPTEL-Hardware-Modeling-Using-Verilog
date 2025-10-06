`timescale 1ns/1ps
`include "fsm1.v"
module tb_detect111;
    reg clk, in;
    wire detect;
detect111 dut (
        .clk(clk),
        .in(in),
        .detect(detect)
        
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // 10ns period
    end

    // Test sequence
    initial begin
        $dumpfile("detect111.vcd");  
        $dumpvars(0, tb_detect111);

        // Initialize
        in = 0;
        
        // Apply test pattern
        #10 in = 1;   // first 1
        #10 in = 1;   // second 1
        #10 in = 1;   // third 1 -> detect should go HIGH
        #10 in = 0;   // reset
        #10 in = 1;
        #10 in = 1;
        #10 in = 1;   // detect HIGH again
        #20 $finish;
    end
endmodule
