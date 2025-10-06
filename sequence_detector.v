//***********SEQUENCE DETECTING***********
//_____FSM mealy method
//___Design Of a sequence detector.
//A circuit accepts a serial bit stream "x" as input and produces a serial bit stream " zr• as output.
//Whenever the bit pattern "0110" appears in the input stream, it outputs z = 1; at all other times, z = O.
//Overlapping occurrences of the pattern are also detected.
//This is a Mealy Machine.

module sdt(x,clk,reset,z);
input x,clk,reset;
output reg z;
parameter s0=0,s1=1,s2=2,s3=3;
reg[0:1] ps,ns;

always @(posedge clk or posedge reset) 
    if(reset) ps<=s0;
    else      ps<=ns;

always @(ps,x) begin
    case(ps)
    s0:begin
        z=x?0:0;
        ns=x?s0:s1;
    end
    s1:begin
        z=x?0:0;
        ns=x?s2:s1;
    end
    s2:begin
        z=x?0:0;
        ns=x?s3:s1;
    end
    s3:begin
        z=x?0:1;
        ns=x?s0:s1;
    end
endcase
end

endmodule
