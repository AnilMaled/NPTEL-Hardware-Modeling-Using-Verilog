// FSM to detect "110"
module fsm4(input in, clk, reset, output reg z);

    reg [1:0] state;

    parameter s0 = 2'b00, 
              s1 = 2'b01, 
              s2 = 2'b10,  
              s3 = 2'b11;  

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= s0;
            z <= 0;
        end else begin
            case (state)
                s0: begin
                        state <= in ? s1 : s0;
                        z <= 0;
                    end
                s1: begin
                        state <= in ? s2 : s0;
                        z <= 0;
                    end
                s2: begin
                        state <= in ? s2 : s3;
                        
                        z <= 0;
                    end
                s3: begin
                        state <= in ? s1 : s0; 
                        z <= 1;               
                    end
                default: begin
                        state <= s0;
                        z <= 0;
                    end
            endcase
        end
    end
endmodule
