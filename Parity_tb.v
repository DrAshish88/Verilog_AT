//test bench for parity detector
`timescale 1ns/1ns
`include "Parity.v"

module Parity_tb;
reg clk,x;
wire z;

Parity_det DUT(clk,x,z);

initial
begin
    $dumpfile("parity.vcd");
    $dumpvars(0,Parity_tb);
    $monitor($time,"x=%b, z=%b",x,z);
    clk=1'b0;
end

always #5 clk=~clk;

initial
begin
    #2 x=1; #10 x=0; #10 x=0; #10 x=1;
    #10 x=1; #10 x=0; #10 x=0; #10 x=1;
    #10 x=1; #10 x=0; #10 x=0; #10 x=1;
    #10 $finish;
end
endmodule 