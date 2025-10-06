`timescale 1ns/1ns
`include "full_adder.v"
module testbench;
  reg A, B, Cin;
  wire S, Cout;

  // Instantiate the full_adder module
  full_adder fa (
    .S(S),
    .Cout(Cout),
    .A(A),
    .B(B),
    .Cin(Cin)
  );

  initial begin
    $display("A B Cin | S Cout");
    $display("---------------");

    // Apply all 8 combinations of A, B, Cin
    A = 0; B = 0; Cin = 0; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 0; Cin = 1; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 1; Cin = 0; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 0; B = 1; Cin = 1; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 0; Cin = 0; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 0; Cin = 1; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 1; Cin = 0; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    A = 1; B = 1; Cin = 1; #10;
    $display("%b %b  %b  | %b   %b", A, B, Cin, S, Cout);

    $finish;
  end
endmodule
