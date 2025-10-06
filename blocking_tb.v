
`timescale 1ns/1ns
`include "blocking.v"

/* module blocking_tb; 
blocking uut();
initial
  begin
    $dumpfile("Blocking.vcd");
    $dumpvars(0, blocking_tb);
    #10;
$finish;
  end
endmodule */

/* module blocking_tb;
integer a, b, c, d;

  blocking_assign uut (
  
  );
 initial
  begin
    $monitor ($time,"a=%4d,b=%4d,c=%4d,d=%4d",a,b,c,d);
    

    a=30; b=20; c=15; d=5;
    #100 $finish;
  end
    
endmodule */

module blocking_tb;
integer a, b, c, d,clk;

nonblocking uut (
  
  );
 initial
  begin
    $monitor ($time,"a=%4d,b=%4d,c=%4d",a,b,c,d);
    

    a=30; b=20; c=15; d=5;
    clk=0;
    forever begin
      #5 clk=~clk;
    end
    #100 $finish;
  end
    
endmodule