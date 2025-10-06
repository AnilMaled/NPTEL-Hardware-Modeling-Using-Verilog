// Serial Adder using FSM
module S_adder (
    input a, b, clk, reset,
    output reg s
);
    reg state;   

    // States
    parameter S0 = 1'b0;  
    parameter S1 = 1'b1;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
            s <= 0;
        end else begin
            case (state)
                S0: begin
                        // carry=0
                        case ({a,b})
                            2'b00: begin s <= 0; state <= S0; end // 0+0=0, carry0
                            2'b01: begin s <= 1; state <= S0; end // 0+1=1, carry0
                            2'b10: begin s <= 1; state <= S0; end // 1+0=1, carry0
                            2'b11: begin s <= 0; state <= S1; end // 1+1=0, carry1
                        endcase
                    end
                S1: begin
                        // carry=1
                        case ({a,b})
                            2'b00: begin s <= 1; state <= S0;
                             end 
                            2'b01: begin s <= 0; state <= S1; 
                            end 
                            2'b10: begin s <= 0; state <= S1;
                            end 
                            2'b11: begin s <= 1; state <= S1; 
                            end 
                        endcase
                    end
            endcase
        end
    end
endmodule

