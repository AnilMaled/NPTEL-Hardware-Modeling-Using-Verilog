module sized_numbers_check;
  reg [63:0] a, b, c;
  reg [5:0] d;

  initial begin
    a[31:0] = 32'habc1;         // 32 bits
    b[31:0]  = 8'hef;
    c = 16'h45;
    d = 6'b11011;
    

    $display("a = %0h, b = %0H, c = %0h, d = %0b", a, b, c, d, );
 
    a[63:0] = 64'hxabc1;        // X extension
    b[63:0] = 64'hzef;          // Z extension
    c       = 16'b1;            // Zero extension pads 15 zeros

    $display("a = %0b, b = %0b, c = %0h", a, b, c); 
  end
endmodule
