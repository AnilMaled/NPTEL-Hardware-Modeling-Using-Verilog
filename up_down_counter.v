//which can count
//mode will tell you conunt up or down  (mode=0 :down ,mode=1:up)
//clr will clear the counter
//ld will assign input
//d in is input
//clk is clock

//up-down conter syncronus clear
//behaviaral type
module Counter(mode,clr,clk,ld,d_in,count);
  input mode,clk,clr,ld;
  input[0:7] d_in;
  output reg[0:7] count;

  always @(posedge clk) begin
    if (ld)        count<=d_in;
    else if (clr)  count<=0;
    else if (mode) count<=count+1;
    else           count<=count-1;
  end
  
endmodule