//adder using beheviaral model
//it done on generation status flags

module ALU (X, Y, Z, Sign, Zero, Carry, Parity, Overflow);//ALU only for adder
    input [15:0] X, Y;
    output [15:0] Z;
    output Sign, Zero, Carry, Parity, Overflow; //flags
    assign {Carry, Z} = X + Y; // 16-bit addition
    assign Sign = Z[15];//You check the most significant bit (MSB) of Z.
    assign Zero = ~|Z;  //it tell wether result is zero or not if zero it set to 1
    assign Parity = ~^Z;//even or odd
    assign Overflow =(X[15]&Y[15]&~Z[15])|(~X[15]&~Y[15]&Z[15]);
endmodule

