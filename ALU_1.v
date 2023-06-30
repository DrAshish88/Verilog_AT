module ALU(A,B,C,Sign,Zero,Parity,Carry,Overflow);
input [15:0]A,B;
output[15:0]C;
output Sign,Zero,Parity,Carry,Overflow;
wire[2:0]n;

assign Zero=~|C;
assign Sign=C[15];
assign Parity=~^C;
assign Overflow=(A[15]&B[15]&~C|~A[15]&~B[15]&C);

adder Y1(C[3:0],n[0],A[3:0],B[3:0],1'b0);
adder Y2(C[7:4],n[1],A[7:4],B[7:4],n[0]);
adder Y3(C[11:8],n[2],A[11:8],B[11:8],n[1]);
adder Y4(C[15:12],Carry,A[15:12],B[15:12],n[2]);

endmodule

module adder(z,cout,x,y,cin);
input[3:0]x,y;
input[3:0]z;
input cin;
output cout;
wire [2:0]m;

FA A1(z[0],m[0],x[0],y[0],cin);
FA A2(z[1],m[1],x[1],y[1],m[0]);
FA A3(z[2],m[2],x[2],y[2],m[1]);
FA A4(z[3],cout,x[3],y[3],m[2]);

endmodule

module FA(s,c,a,b,ci);
input a,b,ci;
output s,c;
wire [2:0]w;

xor G1(w0,a,b), G2(s,w0,ci);
and G3(w1,a,b), G4(w2,w0,ci);
or G5(c,w1,w2);

endmodule