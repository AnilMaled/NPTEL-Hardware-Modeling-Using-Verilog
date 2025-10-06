`timescale 1ns/1ns
`include "adders.v"

module adders_tb;
   reg[15:0]X,Y;
   wire[15:0]Z;
   wire Sign, Zero, Carry, Parity, Overflow;
   ALU DUT (X, Y, Z, Sign, Zero, Carry, Parity, Overflow);

   initial
   begin
    $dumpfile("ALU.vcd");
    $monitor($time," X=%h, Y=%h, Z=%h,Sign=%b,Zero=%b,Carry=%b,Parity=%b,Overflow=%b",X, Y, Z, Sign, Zero, Carry, Parity, Overflow);
    #5 X = 16'h8fff; Y = 16'h8000;
    #5 X = 16'hfffe; Y = 16'h0002;
    #5 X = 16'hAAAA; Y = 16'h5555;
    #5 $finish;
   end
endmodule