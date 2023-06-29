`timescale 1ns/1ns
`include "HA.v"

module HA_tb;
reg A,B;
wire S,C;

HA DUT(A,B,S,C);

initial begin
    $dumpfile("HA_tb.vcd"); 
    $dumpvars(0, HA_tb);
    
    $monitor($time,"A=%b, B=%b, S=%b, C=%b", A,B,S,C);
    #5 A=1'b0; B=1'b1;
    #10 A=1'b1; B=1'b1;
    #15 A=1'b1; B=1'b0;
    #20 $finish;
end
endmodule