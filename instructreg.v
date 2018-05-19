`timescale 1ns/1ns
module instructreg(input[12:0] in,input rst,output reg[7:0] out);
	reg[7:0]r[0:8191];
	always@(in,rst)begin
		r[0]<=8'b00000000;
		r[1]<=8'b00000000;
		r[2]<=8'b01000000;
		r[3]<=8'b00000001;
		r[4]<=8'b00100000;
		r[5]<=8'b00000010;
		r[8191]<=8'b11100000;
		if(rst)
			out<=0;
		else
			out<=r[in];
	end
endmodule
