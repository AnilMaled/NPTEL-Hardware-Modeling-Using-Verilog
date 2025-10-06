/* 
module while_ex;
    integer num; // declare num as integer

    initial begin
        num = 0; // initialize num
        while (num <= 255) begin
            $display("The number is: %d", num);
            num = num + 1;
        end
    end
endmodule 
*/

//for loop
/* 
module For;
integer num;
reg [100:1] data;
integer i;
 initial
 begin
    for(num=0;num<25;num++)
    $display("the numbers are:%d",num);
 end 
initial begin
   
    for (i = 1; i <= 100; i = i + 1) begin
        data[i] = 1'b0;
        $display("The number is: %d", i);
    end
end
endmodule
 */

//repeat for loop
/* construt he "repeat" construct executes the
loop a fixed number Of times.
It cannot be used to loop on a general
logical expression like "while".
The expression in the "repeat" construct can
be a constant, a variable or a signal value.
• If it is a variable or a signal value, it is
ted only when the loop starts and
tab
ring execution of the loop
The sequential _ statement can be a single
statement or a group of statements within
"begin end".
 */
module Repeat;
reg clk;
initial
 begin clk=1'b0;
 repeat (100)
   #5 clk=~clk;
 end
endmodule



