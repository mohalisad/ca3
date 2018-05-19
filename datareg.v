`timescale 1ns/1ns
module datareg(input[12:0] addr,input[7:0] data,input ld,output reg[7:0] out);
	reg[7:0]r[0:8191];
	reg init=0;
	always@(addr,data,ld)begin
		if(!init)begin
			r[0]<=15;
			r[1]<=20;
			init<=1;
		end
		if (ld) r[addr]<=data;
		else out<=r[addr];
	end
endmodule
