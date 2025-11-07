// testbench.v
`timescale 1ns/1ps
module Testbench;
reg clk;

CPU cpu_inst (.clk(clk));

// Clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Simulation control
initial begin
    $dumpfile("cpu_wave.vcd");  // waveform output
    $dumpvars(0, Testbench);
    #50 $finish;
end
endmodule
