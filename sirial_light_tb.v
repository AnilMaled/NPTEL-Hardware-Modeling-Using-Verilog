`timescale 1ns / 1ps
`include "sirial_light.v"
/* 
module sltb;
reg clk;
wire[0:2] light;

slight dut(clk,light);

always #5 clk=~clk;
initial
  begin
    clk=1'b0;
    #100 $finish;
  end
initial
   begin
    $dumpfile("slight.vcd");
    $dumpvars(0,sltb);
    $monitor($time,"RGY:%b",light);
   end
endmodule
 */

 //test bench for parity generator
 module parity_tb;
 reg clk,x; wire z;

 parity_gen DUT(clk,x,z);

 initial
   begin
    $dumpfile("parity_gen.vcd");
    $dumpvars(0,parity_tb);
     clk=1'b0;
   end
  always #5 clk=~clk;
initial
begin   //we are using #2 delay foe input just beacause to make input variable stable before trigerrings
  #2 x=1'b0; #10 x=1'b1; #10 x=1'b0; #10 x=1'b1;
  #10 x=1'b0; #10 x=1'b1; #10 x=1'b0; #10 x=1'b1;
  #10 $finish;
end
endmodule