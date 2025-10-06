module latch(q,qbar,d,enable);
input d,enable;
output reg q;
output  qbar;
assign qbar=~q;
always @ (d or enable)
begin
  if (enable) q= d;
end
endmodule