primitive udp_fas(s,a,b,c);
    input a, b, c;
    output s;
    table
       0 0 0 : 0;
       0 0 1 : 1;
       0 1 0 : 1;
       0 1 1 : 0;
       1 0 0 : 1;
       1 0 1 : 0;
       1 1 0 : 0;
       1 1 1 : 1;
    endtable
endprimitive

primitive udp_fac(cary,a,b,c);
    output cary;
    input a, b, c;
    table
       0 0 0 : 0;
       0 0 1 : 0;
       0 1 0 : 0;
       0 1 1 : 1;
       1 0 0 : 0;
       1 0 1 : 1;
       1 1 0 : 1;
       1 1 1 : 1;
    endtable
endprimitive

module fulladder(a,b,c,s,cary);
    input a, b, c;
    output s, cary;

    udp_fas S(s,a,b,c);
    udp_fac C(cary,a,b,c);
endmodule
