module s4B(clk,clr,a,e);
input clk,clr,a;
output reg e;
reg b,c,d;

always @(posedge clk or negedge clr) begin
    if(!clr)begin ;b<=0;c<=0;d<=0;e<=0; end

    else  begin
        e<=d;
        d<=c;
        c<=b;
        b<=a;
    end

    
end
endmodule