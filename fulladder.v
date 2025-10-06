/* module half_adder_dataflow(S,C,A,B);
  input A,B;
  output S,C;
  assign S=A^B;
  assign c=A&B;
endmodule */

/* module full_adder(S,Cout,A,B,Cin);
  input A,B,Cin;
  output S,Cout;
  wire S1,C1,C2;
    //sum
    xor u1(S1,A,B);
    xor u2(S,Cin,S1);

    //carry
    and u3(C1,A,B);
    and u4(C2,S1,Cin);
    or  u5(Cout,C1,C2);
endmodule */

module counter(clk,rst,count);
  input clk,rst;
  output[31:0]count;

  always @(posedge clk)
  begin
    if (rst) 
      count=32'b0;
    else
      count=count+1;
      
    end
    
  endmodule
