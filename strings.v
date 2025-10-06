module String;
reg[8*20:1]str;//declear the size of the string 
//string strired by there ASCI values
reg[8*20:1]str1;
 
initial begin
    str="i am \n anil";
    str1="fuck you";
    $display("the string is:%s",str);//display rules are like in c program (%d,%s,%c)
    $display("the string is:%s",str1[20:1]);//array slicing
    end
endmodule