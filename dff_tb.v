`timescale 1ns / 1ps
`include "dff.v"

/* module dff_tb;

    // Testbench signals
    reg d, set, reset, clk;
    wire q, qbar;

    // Instantiate the D flip-flop module
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(set),
        .reset(reset),
        .clk(clk)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10 ns clock period

    initial begin
        // Initial values
        clk = 0;
        d = 0;
        set = 1;    // Active low
        reset = 1;  // Active low

        $display("Time\tclk\treset\tset\td\tq\tqbar");
        $monitor("%0dns\t%b\t%b\t%b\t%b\t%b\t%b", $time, clk, reset, set, d, q, qbar);

        // Test 1: Reset active
        #2 reset = 0; #10 reset = 1;

        // Test 2: Set active
        #2 set = 0; #10 set = 1;

        // Test 3: Normal operation with D
        #5 d = 1;   // At rising edge, q should follow d
        #10 d = 0;  // At next rising edge, q should follow d

        // Test 4: Toggle D again
        #10 d = 1;

        // Test 5: Glitch test - toggle set and reset briefly
        #5 set = 0; #5 set = 1;
        #5 reset = 0; #5 reset = 1;

        // Finish simulation
        #20 $finish;
    end

endmodule
 */



module dff_tb;

    // Signals
    reg d, clk;
    wire q, qbar;

    // Instantiate the D Flip-Flop
    dff uut (
        .q(q),
        .qbar(qbar),
        .d(d),
        .set(),      // Unused, left unconnected
        .reset(),    // Unused, left unconnected
        .clk(clk)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Dump VCD for GTKWave
        $dumpfile("dff_tb.vcd");
        $dumpvars(0, dff_tb);

        // Initialize inputs
        clk = 0;
        d = 0;

        $display("Time\tclk\td\tq\tqbar");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, d, q, qbar);

        // Test pattern
        #8  d = 1;   // q should become 1 at next clk ↑
        #10 d = 0;   // q should become 0 at next clk ↑
        #10 d = 1;   // q should become 1 at next clk ↑
        #10 d = 1;   // q should stay 1
        #10 d = 0;   // q should become 0
        #10;

        $finish;
    end

endmodule
