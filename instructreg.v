`timescale 1ns/1ns
module instructreg(input[12:0] in,input rst,output reg[7:0] out);
	reg[7:0]r[0:8191];
	always@(in,rst)begin
		r[8191]<=0;
		if(rst)
			out<=0;
		else
			out<=0;//r[in];
	end
endmodule