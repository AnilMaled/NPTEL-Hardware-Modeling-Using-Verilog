module full_adder(S,Cout,A,B,Cin);
  input A,B,Cin;
  output S,Cout;
  wire S1,C1,C2;
    //sum
    xor #10 u1(S1,A,B);
    xor u2(S,Cin,S1);

    //carry
    and u3(C1,A,B);
    and u4(C2,S1,Cin);
    or  u5(Cout,C1,C2);
endmodule