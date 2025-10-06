`timescale 1ns / 1ps
`include "generate.v"
module generate_tb;

reg[15:0] x,y;
wire [15:0] out;

bitwise_xor G(.f(out),.a(x),.b(y));

initial
  begin
    $monitor("x: %d, y: %d, out: %d",x,y,out);
    x=16'haaaa; y=16'h00ff;
    #10 x=16'h0f0f; y=16'h3333;
    #20 $finish;

  end
endmodule