`timescale 1ns / 1ps
`include "sequence_detector.v"

module ts;
reg clk,x,reset;
wire z;
sdt DUT(x,clk,reset,z);

initial begin
    $dumpfile("sdt.vcd"); $dumpvars(0,ts);
    clk=1'b0;
    reset=1'b1;
    #15 reset=1'b0;
end
always #5 clk=~clk;
initial
   begin
    #12 x=0; #10 x=0; #10 x=1; #10 x=1;
    #10 x=0; #10 x=1; #10 x=1; #10 x=0;
    #10 x=0; #10 x=1; #10 x=1; #10 x=0;
    #10 $finish;
   end
endmodule
