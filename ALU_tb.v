//This is how we can write the testbench for ALU(Adder operation only)
`timescale 1ns/1ns
`include "ALU.v"

module ALU_tb;
reg [15:0] A,B;
wire[15:0]C;
wire S,Z,P,Cout,Ov;

ALU DUT(A,B,C,S,Z,P,Cout,Ov);
initial begin
    $dumpfile("ALU_tb.vcd");
    $dumpvars(0,ALU_tb);

    $monitor($time,"A=%h,B=%h,C=%h,S=%b,Z=%b,P=%b,Cout=%b,Ov=%b", A,B,C,S,Z,P,Cout,Ov);
    #5 A=16'h0348; B=16'h354e;
    #5 A=16'h0125; B=16'h25fe;
    #5 A=16'h34cd; B=16'hef12;
    #20 $finish;

end

endmodule