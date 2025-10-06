`timescale 1ns / 1ps
`include "strings.v"

module String_tb;

    // Instantiate the DUT (Device Under Test)
    String uut(); // no ports, since the original module has none

    initial begin
        // Just run the simulation long enough to see the output
        #10;
        $finish;
    end

endmodule
