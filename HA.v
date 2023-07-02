// This is the code for Halfadder using its behavioral/dataflow style
module HA(A,B,Sum,Cout);
input A,B;
output Sum,Cout;

assign Sum=A^B;
assign Cout=A&B;
endmodule