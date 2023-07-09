//This code is written for the sequence detection of 101101
module Moore_FSM(Reset, Clock, x,z);
    input Reset, Clock, x;
    output reg z;
    parameter S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6; //to show different state transistions
    reg [2:0] PS,NS; //present and next state variables

always @(posedge Clock or posedge Reset) //this always block is to store the state information
    if(Reset) PS<=S0; //if reset is active then remain at  state 0
    else PS<= NS;//if reset is not active then go to next state

always@(PS,x) //this always block is for stransition between states depending upon PS & PI
    case(PS) //PS=present state, PI=present input
    S0:begin
        z=0;
        NS=x?S1:S0;
    end
    S1:begin
        z=0;
        NS=x?S1:S2;
    end
    S2:begin
        z=0;
        NS=x?S3:S0;
    end
    S3:begin
        z=0;
        NS=x?S4:S2;
    end
    S4:begin
        z=0;
        NS=x?S1:S5;
    end
    S5:begin
        z=0;
        NS=x?S6:S0;
    end
    S6:begin
        z=1;
        NS=x?S1:S2;
    end
endcase
endmodule
