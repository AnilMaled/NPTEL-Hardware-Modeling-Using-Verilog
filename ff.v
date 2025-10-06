/* //SR flip flop
module SR(clk,a,b,q1,q2);
  input clk,a,b;    
  output reg q1,q2;

  always @( clk==1)
  begin
    if(a==0&b==0)begin
        //no
        q1 = q1;
        q2 = q2;
    end
    else if (a == 0 && b == 1) begin
      // Reset
      q1 = 0;
      q2 = 1;
    end
    else if (a == 1 && b == 0) begin
      // Set
      q1 = 1;
      q2 = 0;
    end
    else if (a == 1 && b == 1) begin
      // Invalid condition for SR FF
      q1 = 1'bx;
      q2 = 1'bx;
    end
  end
endmodule */

module SR(clk);
reg clk;
initial
   begin
    clk=1'b0;
    forever #5 clk=~clk;
   end
endmodule