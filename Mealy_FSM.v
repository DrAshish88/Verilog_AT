//This code is to detect the bit stream of 0110 using mealy FSM

module Mealy_FSM(Reset,Clock,x,z);
    input Reset,Clock,x;
    output reg z;
    reg [1:0] PS, NS;
    parameter S0=0,S1=1,S2=2,S3=3;

always @(posedge Clock or posedge Reset)
    if(Reset) PS<=S0;
    else PS<=NS;

always @(PS,x)
case(PS)
S0: begin
    z=0;
    NS=x?S0:S1;
end
S1: begin
    z=0;
    NS=x?S2:S1;
end
S2: begin
    z=0;
    NS=x?S3:S1;
end
S3: begin
    z=1;
    NS=x?S0:S1;
end
endcase
endmodule