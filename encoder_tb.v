
`timescale 1ns/1ns
`include "Encoder.v"
module encoder_tb;

  // Declare testbench signals
  reg [7:0] in;
  wire [2:0] out;

  // Instantiate the encoder module
  Encoder uut (
    .in(in),
    .out(out)
  );

  initial begin
    // Create VCD waveform output
    $dumpfile("Encoder.vcd");
    $dumpvars(0, encoder_tb);

    // Monitor the inputs and outputs
    $monitor("Time=%0t | in=%b => out=%b", $time, in, out);

    // Test input combinations
    in = 8'b00000001; #10;
    in = 8'b00000010; #10;
    in = 8'b00000100; #10;
    in = 8'b00001000; #10;
    in = 8'b00010000; #10;
    in = 8'b00100000; #10;
    in = 8'b01000000; #10;
    in = 8'b10000000; #10;
    in = 8'b00000000; #10;  // No active input

    $finish;
  end

endmodule
