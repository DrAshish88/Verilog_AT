// This is how we can write a simple test bench for Fulladder
`timescale 10ns/1ns
`include "FA.v"

module FA_tb;
reg A,B,C; wire S,Cout;

FA DUT(A,B,C,S,Cout);

initial begin
    $dumpfile("FA_tb.vcd");
    $dumpvars(0, FA_tb);

    $monitor($time,"A=%b, B=%b, C=%b, S=%b, Cout=%b", A,B,C,S,Cout);
    #5 A=1'b0; B=1'b0; C=1'b1;
    #10 A=1'b1; B=1'b0; C=1'b0;
    #10 A=1'b0; B=1'b1; C=1'b1;
    #20 $finish;
end

endmodule