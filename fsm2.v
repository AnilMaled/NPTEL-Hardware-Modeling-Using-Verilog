//generate cercular light Red,Green,Yellow on clock using FSM
// we can see output in GTK wave

module lrg(clk,light);
input clk;
output reg [0:2]light ;
parameter s0 =0,s1=1,s2=2 ;
parameter red=3'b000,green=3'b001,yellow=3'b010;
reg[0:1] sate;

/*  this will generate extra fif flops
 always @(posedge clk) begin
 
    case(sate)
    s0:begin
        light<=green; sate<=s1;
    end
    s1:begin
        light<=yellow; sate<=s2;
    end
    
    s2:begin 
        light<=red; sate<=s0;
    end
    default:begin
      light<=red; sate<=s0;
       end
    endcase
end */

always @(posedge clk) begin
    case(sate)
    s0: sate<=s1;
     s1: sate<=s2;
    s2:sate<=s0;
    
    default:sate<=s0;
       
    endcase
    
end
always@(posedge clk)begin
    case(sate)
    s0:light=red;
    s1:light=green;
    s2:light=yellow;
endcase
end
endmodule
