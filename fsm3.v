//parity detector

module parity(x,clk,z);
input x,clk;
output reg z;
reg even_odd;//the states should be declered as reg
parameter even=0,odd=1; //all different states should diffined in parameter decleration
always @(posedge clk) begin
    case(even_odd)
    even:begin
        z<=x?1:0;  //assign z=1 if x=1 amd assine 0 if x=0
        even_odd<=x?odd:even;
    end
    odd:begin
        z<=x?0:1;
        even_odd<=x?even:odd;
        end
        default:even_odd<=even;
        
endcase
end
endmodule