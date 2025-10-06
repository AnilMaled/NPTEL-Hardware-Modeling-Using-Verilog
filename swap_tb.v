`timescale 1ns/1ps
`include "Swap.v"
module tb_Swap;

reg clk;
wire [7:0] a, b;

// Instantiate DUT
Swap uut (
  .clk(clk),
  .a(a),
  .b(b)
);

// Clock generation
initial begin
  clk = 0;
  forever #5 clk = ~clk;  // 10ns period
end

// Simulation
initial begin
  $display("Time\tclk\ta\tb");
  $monitor("%0dns\t%b\t%d\t%d", $time, clk, a, b);

  #100;  // run for some time
  $finish;
end

endmodule
