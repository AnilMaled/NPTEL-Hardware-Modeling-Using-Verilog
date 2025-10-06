_tbmodule ALU(f,a,b,op);
   input [1:0] op;
   input [7:0]a,b;
   output reg [7:0] f;
   parameter add =2'b00,sub=2'b01 ,mul=2'b10,div=2'b11;

   always @(*)
   case(op)
     add:f=a+b;
     sub:f=a-b;
     mul:f=a*b;
     div:f=a/b;
   endcase
   

endmodule