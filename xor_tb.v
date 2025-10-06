/* `timescale 10ns/1ns
`include "xor.v"

module xor_tb;
    reg a, b;
    wire f;

    // Instantiate the DUT (Design Under Test)
    xor_gate uut (
        .a(a),
        .b(b),
        .f(f)
    );

    initial begin
        $display("Time\t a b | f");
        $monitor("%g\t %b %b | %b", $time, a, b, f);

        // Apply test vectors
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;

        $finish;
    end
endmodule
 */
`timescale 10ns/1ns
`include "xor.v"
 module xor_tb;
  // Declare inputs as reg and outputs as wire
  reg A, B, C;
  wire f1, f2;

  // Instantiate the module under test (MUT)
  a_problem_case DUT (A, B, C, f1, f2);

  initial begin
    // Monitor all signals
    $monitor($time, " A=%b B=%b C=%b | f1=%b f2=%b", A, B, C, f1, f2);

    // Apply input patterns
    A = 0; B = 0; C = 0; #5;
    A = 0; B = 0; C = 1; #5;
    A = 0; B = 1; C = 0; #5;
    A = 0; B = 1; C = 1; #5;
    A = 1; B = 0; C = 0; #5;
    A = 1; B = 0; C = 1; #5;
    A = 1; B = 1; C = 0; #5;
    A = 1; B = 1; C = 1; #5;

    // Finish simulation
    $finish;
  end
endmodule
