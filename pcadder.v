`timescale 1ns/1ns
module pcadder(input[12:0] in,output reg[12:0] out);
	reg co;
	always@(in){co,out}=in+1;
endmodule