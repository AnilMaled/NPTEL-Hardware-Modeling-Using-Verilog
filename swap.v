module Swap(input clk, output reg [7:0] a, output reg [7:0] b, temp_a, temp_b);

initial begin
  a = 8'd10;
  b = 8'd20;
end

/* always @(posedge clk)
  //a = b;//blockilg
  a<=b;//non blocking correct way

always @(posedge clk)
  //b = a;
  b<=a;
 */
 always @(posedge clk)//we can swap by bloking by using additinal temp 
   begin
     temp_a=a;
     temp_b=b;
     a=temp_b;  //using non blocking assignments
     b=temp_a;
   end
endmodule
