`timescale 10ns/1ns
`include "mux.v"
`include "mux4to1.v"
`include "mux2to1.v"
module mux_tb;
  reg[15:0]A;
  reg[3:0]S;
  wire F;

  mux M (.in(A),.sel(S),.out(F));


  initial
    begin
        $dumpfile("mux.vcd");
        $dumpvars(0,mux_tb);
        $monitor($time,"a=%h,s=%h,F=%b",A,S,F);
        #5 A=16'h3f0a;
        #5 S=4'h0;
        #5 S=4'h1;
        #5 S=4'h6;
        #5 S=4'h0;
        #5 $finish;
    end
endmodule