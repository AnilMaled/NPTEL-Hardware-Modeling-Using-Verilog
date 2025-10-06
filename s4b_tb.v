
`timescale 1ns/1ps
`include "s4B.v"
module s4b_tb;
reg clk,clr,A;
wire E;

s4B dut(.clk(clk),.clr(clr),.a(A),.e(E));

initial begin
    clk=1'b0;
    #2 clr=1'b0;
    #5 clr=1'b1;

end
always #5 clk=~clk;
initial begin 
    
    
    repeat(2) begin
        #10 A<=0;
        #10 A<=0;
        #10 A<=1;
        #10 A<=1;
    end
  
  
end
initial begin
    $dumpfile("s4b_tb.vcd");
    $dumpvars(0,s4b_tb);

    #200 $finish;
end

endmodule