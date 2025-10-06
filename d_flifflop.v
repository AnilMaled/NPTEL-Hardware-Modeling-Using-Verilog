module dff(q,qbar,d,set,reset,clk);
    input d,set,reset,clk;
    output reg q;
    output qbar;
    assign qbar=~q;

    always @(posedge clk) begin
        /* if(reset==0) q<=0;
        else if(set==0) q<=1;
        else q<=d; */
        if(d==0) q<=0;
        else if(d==1) q<=1;
        else q<=q;
    end
endmodule