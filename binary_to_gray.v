//convert bits from binary to gray code
/* 
module binary_to_gray(binary,gray);
input [3:0] binary;
output [3:0] gray;
assign gray=binary^(binary>>1);
endmodule
 */

module gray_binary(bi,gy);
input [3:0] bi;
output [3:0] gy;

integer  i;

always@(*) begin
   gy[3] = bi[3];  
        for (i = 2; i >= 0; i = i - 1) begin
            gy[i] = gy[i+1] ^ bi[i];
        end

end
endmodule