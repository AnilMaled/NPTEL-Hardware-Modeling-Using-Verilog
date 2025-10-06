
`include "fff.v"
`timescale 1ns/1ps

module SR_tb;
  wire clk;

  // Instantiate the SR module
  SR uut (.clk(clk));

  // Monitor the clk signal
  initial begin
    $display("Time\tclk");
    $monitor("%0t\t%b", $time, clk);
  end

  // Generate VCD waveform output
  initial begin
    $dumpfile("dump.vcd");     // Name of the VCD file
    $dumpvars(0, SR_tb);       // Dump all variables in the testbench
  end

  // Run the simulation for 50 time units
  initial begin
    #50;
    $finish;
  end
endmodule


/* module ff_tb;
  reg clk,a,b;
  wire q1,q2;

  SR uut( .clk(clk),.a(a),.b(b),.q1(q1),.q2(q2));

  initial
   begin
    clk=0;
    forever #5 clk = ~clk; 
   end
  initial 
  begin
    // Display header
    $display("Time\tclk\ta\tb\tq1\tq2");

    // Monitor signal values
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, a, b, q1, q2);
   // Initial state
    a = 0; b = 0;

    // Apply different input combinations at rising clock edges
    #10 a = 0; b = 1;  // Set
    #10 a = 1; b = 0;  // Reset
    #10 a = 1; b = 1;  // Invalid
    #10 $finish;       // End simulation
  end
endmodule
 */


/* module ff_tb;
  reg clk, a, b;
  wire q1, q2;

  // Instantiate the SR flip-flop
  SR uut (
    .clk(clk),
    .a(a),
    .b(b),
    .q1(q1),
    .q2(q2)
  );

  // Clock generation: toggles every 5 time units
  initial begin
    clk = 0;
    forever #5 clk = 1;
  end

  // Stimulus
  initial begin
    // Display header
    $display("Time\tclk\ta\tb\tq1\tq2");

    // Monitor signal values
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", $time, clk, a, b, q1, q2);

    // Initial state
    a = 0; b = 0;

    // Apply different input combinations at rising clock edges
    #10 a = 1; b = 0;  // Set
    #10 a = 0; b = 1;  // Reset
    #10 a = 0; b = 0;  // No change
    #10 a = 1; b = 1;  // Invalid
    #10 a = 0; b = 0;  // Back to no change
    #10 $finish;       // End simulation
  end
endmodule
 */