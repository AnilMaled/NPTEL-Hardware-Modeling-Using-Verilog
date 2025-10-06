//circuite to detect serial 111's
// FSM to detect sequence "111" on serial input
// result can be seen on gtk waveforms

module detect111 (in,clk,detect);
input clk;
input in;
output reg detect;

 parameter A=2'b00,  
              B=2'b01,
                C=2'b10,
              D=2'b11;

    reg [1:0] state, next_state;

    
    always @(posedge clk) begin
        state <= next_state;
        
    end
initial state = A;


    
    always @(*) begin
        case(state)
            A: next_state = (in) ? B : A;   
            B: next_state = (in) ? C : A;   
            C: next_state = (in) ? D : A;   


            D: next_state = (in) ? D : A;   
            default: next_state = A;
        endcase
    end

   
    always @(*) begin
        detect = (state == D);
    end
endmodule
