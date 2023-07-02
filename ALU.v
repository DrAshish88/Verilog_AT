//This is the example of ALU (only adder opertion is considered here)
module ALU(A,B,C,Sign,Zero,Parity,Carry,Overflow);
input [15:0]A,B;
output[15:0]C;
output Sign,Zero,Parity,Carry,Overflow;

assign {Carry,C}=A+B;
assign Zero=~|C;
assign Sign=C[15];
assign Parity=~^C;
assign Overflow=(A[15]&B[15]&~C|~A[15]&~B[15]&C);

endmodule
