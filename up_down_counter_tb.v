`timescale 1ns/1ps
`include "up_down_counter.v"

module Counter_tb;

  // Testbench signals
  reg mode, clr, clk, ld;
  reg [0:7] d_in;
  wire [0:7] count;

  // Instantiate the Counter module
  Counter uut (
    .mode(mode),
    .clr(clr),
    .clk(clk),
    .ld(ld),
    .d_in(d_in),
    .count(count)
  );

  // VCD Dump for GTKWave
  initial begin
    $dumpfile("counter.vcd");      // Name of the waveform file
    $dumpvars(0, Counter_tb);      // Dump all variables in this module
  end

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns period
  end

  // Test sequence
  initial begin
    // Initialize
    mode = 0; clr = 0; ld = 0; d_in = 8'b00000000;
    #10;

    // Load 10
    d_in = 8'b00001010; 
    ld = 1; #10; ld = 0;

    // Clear
    clr = 1; #10; clr = 0;

    // Count up (mode=1)
    mode = 1;
    #50;

    // Count down (mode=0)
    mode = 0;
    #50;

    $finish;
  end

  // Monitor console output
  initial begin
    $monitor("Time: %0t | clk=%b clr=%b ld=%b mode=%b d_in=%b count=%b",
             $time, clk, clr, ld, mode, d_in, count);
  end

endmodule
