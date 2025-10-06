
`include "aa.v"
`timescale 1ns/1ps

module tb_mux_21;
  reg [3:0] a;
  reg [3:0] b;
  reg sel;
  wire [3:0] f;

  // Instantiate the DUT (Device Under Test)
  mux_21 uut (
    .a(a),
    .b(b),
    .sel(sel),
    .f(f)
  );

  initial begin
    $monitor("Time=%0t | a=%b | b=%b | sel=%b | f=%b", $time, a, b, sel, f);

    // Test case 1
    a = 4'b1010; b = 4'b0101; sel = 0; #10;
    sel = 1;                          #10;

    // Test case 2
    a = 4'b1111; b = 4'b0000; sel = 0; #10;
    sel = 1;                          #10;

    // Test case 3
    a = 4'b0011; b = 4'b1100; sel = 0; #10;
    sel = 1;                          #10;

    $stop; // End simulation
  end
endmodule
