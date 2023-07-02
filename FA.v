// This is the code for Fulladder using its behavioral/dataflow style
module FA(A,B,C,Sum,Carry);
input A,B,C;
output Sum,Carry;

assign Sum=A^B^C;
assign Carry=(A&B)|(B&C)|(C&A);

endmodule