`timescale 1ns / 1ps
`include "parallel_adder.v"
module test_ripple_carry_adder_4bit;
    /* // Inputs
    reg [3:0] a, b;
    reg cin;

    // Outputs
    wire [3:0] sum;
    wire cout;

    // Instantiate the ripple carry adder
    ripple_carry_adder_4bit RCA (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial begin
        $display("Time\t a    b   cin | sum  cout");
        $display("-------------------------------");
        
    $dumpfile("parallel_adder.vcd");  // Name of the VCD dump file
    $dumpvars(0, test_ripple_carry_adder_4bit); // Dump all variables in this module and below


        // Test case 1
        a = 4'b0001; b = 4'b0010; cin = 0;
        #10 $display("%0t\t%b + %b + %b = %b  %b", $time, a, b, cin, sum, cout);

        // Test case 2
        a = 4'b0101; b = 4'b0011; cin = 0;
        #10 $display("%0t\t%b + %b + %b = %b  %b", $time, a, b, cin, sum, cout);

        // Test case 3
        a = 4'b1111; b = 4'b0001; cin = 0;
        #10 $display("%0t\t%b + %b + %b = %b  %b", $time, a, b, cin, sum, cout);

        // Test case 4
        a = 4'b1111; b = 4'b1111; cin = 1;
        #10 $display("%0t\t%b + %b + %b = %b  %b", $time, a, b, cin, sum, cout);

        $finish;
        

    end */
    reg a,b,cin; wire sum,cout;
    integer i;
    full_adder FA (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    initial
    begin
        $dumpfile("full_adder.vcd");    //to see simulation output grhapicaly
        $dumpvars(0,test_ripple_carry_adder_4bit); //it dump the all variables in tb ti dumpfile
        for(i=0;i<8;i++)
        begin
            {a,b,cin}=i;#5; //cancatination it will assign binarry value by itself
            $display("T=%2d,a=%b,b=%b,cin=%b,sum=%b,cout=%b",$time,a,b,cin,sum,cout);
        end
        #5 $finish;
    end
endmodule
