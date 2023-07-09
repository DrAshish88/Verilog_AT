//This code is to detect even and odd parity
module Parity_det(Clock,x,z);
    input Clock,x;
    output reg z;
    reg even_odd;
    parameter even=0, odd=1;

always @(posedge Clock)
case(even_odd)
even: even_odd<=x?odd:even;
odd: even_odd<=x?even:odd;
endcase

always @(even_odd)
case(even_odd)
even: z=0;
odd: z=1;
endcase

endmodule