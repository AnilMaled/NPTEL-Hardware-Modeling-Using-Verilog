module half_adder(a,b,s,c);
input a,b;
output s,c;
assign s=(a^b);
assign c=a&b;
endmodule

// Full Adder using two half adders
module full_adder(a, b, cin, sum, cout);
    input a, b, cin;
    output sum, cout;

    wire s1, c1, c2;

    half_adder HA1 (.a(a), .b(b), .s(s1), .c(c1));
    half_adder HA2 (.a(s1), .b(cin), .s(sum), .c(c2));

    assign cout = c1 | c2;
endmodule

// 4-bit Ripple Carry Adder
module ripple_carry_adder_4bit(a, b, cin, sum, cout);
    input [3:0] a, b;
    input cin;
    output [3:0] sum;
    output cout;

    wire c1, c2, c3;

    full_adder FA0 (.a(a[0]), .b(b[0]), .cin(cin),  .sum(sum[0]), .cout(c1));
    full_adder FA1 (.a(a[1]), .b(b[1]), .cin(c1),   .sum(sum[1]), .cout(c2));
    full_adder FA2 (.a(a[2]), .b(b[2]), .cin(c2),   .sum(sum[2]), .cout(c3));
    full_adder FA3 (.a(a[3]), .b(b[3]), .cin(c3),   .sum(sum[3]), .cout(cout));
endmodule