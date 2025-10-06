`timescale 1ns/1ps
`include "udp.v"

module tb_fulladder;
    reg a, b, c;         // Inputs
    wire s, cary;        // Outputs

    // Instantiate DUT
    fulladder dut (
        .a(a),
        .b(b),
        .c(c),
        .s(s),
        .cary(cary)
    );

    initial begin
        $display("A B Cin | Sum Carry");
        $display("------------------");

        // Apply all combinations
        {a,b,c} = 3'b000; #5;
        {a,b,c} = 3'b001; #5;
        {a,b,c} = 3'b010; #5;
        {a,b,c} = 3'b011; #5;
        {a,b,c} = 3'b100; #5;
        {a,b,c} = 3'b101; #5;
        {a,b,c} = 3'b110; #5;
        {a,b,c} = 3'b111; #5;

        $finish;
    end

    // Monitor values
    initial begin
        $monitor("%b %b  %b   |  %b    %b", a, b, c, s, cary);
    end
endmodule

