//Blocking assignments
/* 
General syntax:
   variable_name=[delay_or_event_control] expression ;
The "="operator is used to specify blocking assignment.
Blocking assignment statements are executed in the order they are specified in
a procedural block.
The target of an assignments gets updated before the next sequential statement in
the procedural block is executed.
They do not block execution of statements in other procedural blocks.
This is the recommended style for modeling combinational logic. 
Blocking assignments can also generate sequential circuit elements during
synthesis (e.g. incomplete specification in multi-way branching with "case")
An example Of blocking assignment:
*/

/* module Blocking;
  integer a,b,c,d;
  initial
   begin
    a=10;
    b=20;
    c=40;
    d=39;
    a=b+c;
    a=d-c;
    b=a+5;
    c=a-b;
   end

endmodule */

/* module blocking_assign;
integer a, b, c, d;

a=30; b=20; c=15; d=5;
 
   always @(*) 
  
   repeat (4)//this repeats this block 4 times
   begin
      #5 a=b+c;
      #5 d=a-3;
      #5 b=d+10;
      #5 c=c+1;
   end

endmodule */

//non blocking
//a<= #5 b+c;  concurent assignment
/* module non_blocking_assign;
integer a, b, c;
initial
 begin
a=30; b=20; c=15; 
 end
   
  
   initial
   begin
     a<= #5 b+c;
     b<= #5 a-3;   // all are happene at simuklateneusly based on initial values
     c<= #5 b+10;
     
   end

endmodule
 */

 module nonblocking;
 integer a,b,c,d;
 reg clk;
 always @(posedge clk)
  begin
     a<= #5 b+c;
     d<= #5 a+c;
     b<= #5 a-3;   
     c<= #5 b+10;
  end
endmodule
