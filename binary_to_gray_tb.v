`timescale 1ns/1ps
`include "binary_to_gray.v"

/*
 module tb;
reg [3:0]binary; wire [3:0]gray;
binary_to_gray dut(.binary(binary),.gray(gray));

initial
begin
       binary<=4'b0101;
    #5 binary<=4'b1010;
    #5 binary<=4'b1110;
    #5 binary<=4'b1011;
    

end
initial
begin
      $monitor($time, " binary=%b gray=%b", binary, gray);
end
endmodule

 */


//tb for g to g
module tb;
    reg  [3:0] gray_in;      // Gray code input
    wire [3:0] binary_out;   // Binary output

    // DUT instantiation
    gray_binary dut (
        .bi(gray_in),
        .gy(binary_out)
    );

    initial begin
        // Apply test vectors
        gray_in = 4'b0000;   // Binary = 0000
        #5 gray_in = 4'b0001; // Binary = 0001
        #5 gray_in = 4'b0011; // Binary = 0010
        #5 gray_in = 4'b0010; // Binary = 0011
        #5 gray_in = 4'b0110; // Binary = 0100
        #5 gray_in = 4'b0111; // Binary = 0101
        #5 gray_in = 4'b0101; // Binary = 0110
        #5 gray_in = 4'b0100; // Binary = 0111
        #5 gray_in = 4'b1100; // Binary = 1000
        #5 gray_in = 4'b1101; // Binary = 1001
        #5 gray_in = 4'b1111; // Binary = 1010
        #5 gray_in = 4'b1110; // Binary = 1011
        #5 gray_in = 4'b1010; // Binary = 1100
        #5 gray_in = 4'b1011; // Binary = 1101
        #5 gray_in = 4'b1001; // Binary = 1110
        #5 gray_in = 4'b1000; // Binary = 1111
        #5 $finish;
    end

    initial begin
        $monitor("Time=%0t Gray=%b -> Binary=%b", $time, gray_in, binary_out);
    end
endmodule
