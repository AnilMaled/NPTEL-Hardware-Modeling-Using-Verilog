/* 
`timescale 1ns/1ns
`include "adders_example.v"

module adders_example_tb;

// module tb_half_adder_dataflow
reg A, B;
wire S, C;

// Instantiate the Half Adder module
half_adder_dataflow uut (S, C, A, B);

initial begin
    $display("Time\tA B | S C");
    $monitor("%g\t%b %b | %b %b", $time, A, B, S, C);

    // Test cases
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;

    $finish;
end

initial begin
    $dumpfile("adders_example.vcd");
    $dumpvars(0,adders_example_tb);
end

endmodule 
*/


/* 
`timescale 1ns/1ns
`include "adders_example.v"

module adders_example_tb;

// module tb_half_adder_dataflow
reg A, B,Cin;
wire S, Cout;
 integer i;

// Instantiate the Half Adder module
half_adder_dataflow uut (S, C, A, B);
full_adder uut(S,Cout,A,B,Cin);

  initial begin
    $display(" A  B Cin |  S Cout ");
    $display("--------------------");

    for (i = 0; i < 8; i = i + 1) begin
      {A, B, Cin} = i[2:0];  // Apply inputs
      #5; // Small delay for stable output
      $display(" %b  %b  %b  |  %b   %b", A, B, Cin, S, Cout);
    end

    $finish;
end

initial begin
    $dumpfile("adders_example.vcd");
    $dumpvars(0,adders_example_tb);
end

endmodule 
*/
`timescale 1ns/1ns
`include "adders_example.v"
module adders_example_tb;

  reg clk;
  reg rst;
  wire [31:0] count;

  // Instantiate the module
 counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Generate clock
  always #5 clk = ~clk;  // 10 time unit clock period

  initial begin
    // Initialize signals
    clk = 0;
    rst = 1;

    // Apply reset
    #10;
    rst = 0;

    // Run simulation for some time
    #100;

    // Finish simulation
    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time: %0t | Reset: %b | Count: %d", $time, rst, count);
  end

endmodule
