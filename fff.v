module SR(clk, a, b, q1, q2);
    input clk, a, b;
    output reg q1, q2;

    always @(posedge clk) begin
        if (a == 0 && b == 0) begin
            // Hold: no assignment needed
        end
        else if (a == 0 && b == 1) begin
            q1 <= 0;
            q2 <= 1;
        end
        else if (a == 1 && b == 0) begin
            q1 <= 1;
            q2 <= 0;
        end
        else if (a == 1 && b == 1) begin
            q1 <= 1'bx;
            q2 <= 1'bx;
        end
    end
endmodule
