`timescale 10ns/1ns
`include "counter.v"


module counter_tb;

  // Testbench signals
  reg clk;
  reg reset;
  wire [3:0] count;

  // Instantiate the counter module
  counter uut (
    .clk(clk),
    .reset(reset),
    .count(count)
  );

  // Clock generation: 10ns period (100MHz)
  always #5 clk = ~clk;

  // Test sequence
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1;

    // Apply reset
    #10;
    reset = 0;

    // Let the counter run for a while
    #100;

    // Apply reset again
    reset = 1;
    #10;
    reset = 0;

    // Let it run again
    #50;

    // End simulation
    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time=%0t | reset=%b | count=%d", $time, reset, count);
  end

endmodule
