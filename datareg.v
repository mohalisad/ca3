`timescale 1ns/1ns
module datareg(input[12:0] addr,input[7:0] data,input ld,output reg[7:0] out);
	reg[7:0]r[0:8191];
	reg init=0;
	always@(addr,data,ld)begin
		if(!init)begin
			r[100]<=8'b10000000;
			r[101]<=8'b00010000;
			r[102]<=8'b10000000;
			r[103]<=8'b00010000;
			init<=1;
		end
		if (ld) r[addr]<=data;
		else out<=r[addr];
	end
endmodule