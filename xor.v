/* `timescale 10ns/1ns
module xor_gate(f,a,b);
    input a, b;
    output f;
    wire tl, t2, t3;
    nand #5 ml (tl,a,b);
    and #5 m2 (t2,a,tl):
    and #5 m3 (t3,t1,b);
    nor #5 m4 (f,t2,t3);
endmodule */

module a_problem_case (A, B, C, f1, f2);
  input A, B, C;
  output reg f1, f2;

  always @(A or B or C) begin
    f1 = ~(A & B);
    f2 = f1 ^ C;   // Assuming you meant f2 depends on f1 and C
  end
endmodule
