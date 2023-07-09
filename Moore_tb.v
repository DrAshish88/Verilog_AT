//test bench for detection of 101101 using Moore FSM

`timescale 1ns/1ns
`include "Moore_FSM.v"

module Moore_tb;
reg Rst,Clk,x;
wire z;

Moore_FSM DUT(Rst,Clk,x,z);

initial begin
    $dumpfile("Moore_tb.vcd");
    $dumpvars(0,Moore_tb);
    Clk=1'b0;
    Rst=1'b1;
    #15 Rst=1'b0; //reset active after 15 sec
end

always #5 Clk = ~Clk;

initial begin
    #12 x=0; #10 x=1; #10 x=0; #10 x=1;
    #12 x=1; #10 x=0; #10 x=1; #10 x=0;
    #12 x=0; #10 x=1; #10 x=0; #10 x=1;
    #10 $finish;
end
endmodule