 module mux_21(a,b,sel,f);
 input [3:0]a;
 input [3:0]b;
 input sel;
 output [3:0]f;
 assign f=sel?a:b;
 endmodule