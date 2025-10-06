`timescale 1ns / 1ps
`include "latch.v"
module latch_tb;
  reg d;
  reg enable;
  wire q,qbar;

  latch uut(.d(d),.q(q),.qbar(qbar),.enable(enable));

  
     initial 
     begin
        // Dump VCD for GTKWave
        $dumpfile("latch_tb.vcd");
        $dumpvars(0, latch_tb);
        enable=1;
        d=0;
        $display("Time\td\tq\tqbar");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time ,enable,d, q, qbar);

        // Test pattern
        #8  d = 1;   // q should become 1 at next clk ↑
        #10 d = 0;   // q should become 0 at next clk ↑
        #10 d = 1;   // q should become 1 at next clk ↑
        #10 d = 1;   // q should stay 1
        #10 d = 0;   // q should become 0
        #10;

        $finish;
     end
endmodule