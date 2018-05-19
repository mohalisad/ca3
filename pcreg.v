`timescale 1ns/1ns
module pcreg(input[12:0] in,input clk,rst,output reg[12:0] out);
	always@(posedge clk)begin
		if(rst)
			out<=-1;
		else
			out<=in;
	end
	always@(rst)begin
		if(rst)
			out<=-1;
	end
endmodule