
module ALU_tb;

  // Testbench variables
  reg [7:0] a, b;
  reg [1:0] op;
  wire [7:0] f;

  // Instantiate the ALU module
  ALU uut (
    .f(f),
    .a(a),
    .b(b),
    .op(op)
  );

  initial begin
    // Enable waveform output for GTKWave
    $dumpfile("ALU.vcd");        // Create VCD file
    $dumpvars(0, ALU_tb);        // Dump all variables in this module

    // Monitor the output in the terminal
    $monitor("Time=%0t | a=%d b=%d op=%b => f=%d", $time, a, b, op, f);

    // Test ADD (op = 00)
    a = 8'd15; b = 8'd10; op = 2'b00; #10;

    // Test SUB (op = 01)
    a = 8'd25; b = 8'd5; op = 2'b01; #10;

    // Test MUL (op = 10)
    a = 8'd3; b = 8'd4; op = 2'b10; #10;

    // Test DIV (op = 11)
    a = 8'd20; b = 8'd4; op = 2'b11; #10;

    // Edge case: DIV by 0
    a = 8'd20; b = 8'd0; op = 2'b11; #10;

    $finish;
  end

endmodule
//iverilog -o test ALU.v ALU_tb.v 
//PS C:\Users\anil maled\vlg> vvp test