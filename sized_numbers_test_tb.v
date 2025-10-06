`timescale 1ns/1ns
`include "sized_numbers_test.v"

module sized_numbers_test_tb;

  sized_numbers_check mut();

  initial begin
    $dumpfile("sized_numbers_test_tb.vcd");
    $dumpvars(0, sized_numbers_test_tb);
  end

endmodule
