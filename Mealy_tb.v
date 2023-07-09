//Test bench for Mealy FSM to detect 0110

`timescale 1ns/1ns
`include "Mealy_FSM.v"

module Mealy_tb;
reg Rst,Clk,x;
wire z;

Mealy_FSM DUT(Rst,Clk,x,z);

initial
begin
    $dumpfile("Mealy.vcd");
    $dumpvars(0,Mealy_tb);
    Clk=1'b0;
    Rst=1'b1;
    #15 Rst=1'b0;
end

always #5 Clk=~Clk;

initial
begin
    #12 x=1; #10 x=0; #10 x=0; #10 x=1;
    #10 x=0; #10 x=1; #10 x=1; #10 x=0;
    #10 x=1; #10 x=0; #10 x=0; #10 x=1;
    #10 $finish;
end
endmodule
