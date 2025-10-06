`timescale 1ns / 1ps
`include "up_counter.v"

module test_counter;
  reg clear,clock; wire [0:7] count;

Counter DUT (.clear(clear),.clock(clock),.count(count));

initial
begin
    clock=1'b0;
end
always #5 clock=~clock;

initial
  begin
    clear=1'b1;
    #15 clear=1'b0;
    #200 clear=1'b1;
    #10 $finish;
  end
initial
  begin
    $dumpfile("up_counter.vcd");
    $dumpvars(0,test_counter);
    $monitor($time  ,"  count:%d",count);
  end
endmodule