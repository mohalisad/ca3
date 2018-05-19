`timescale 1ns/1ns
module datareg(input[12:0] addr,input[7:0] data,input ld,output reg[7:0] out);
	reg[7:0]r[0:8191];
	reg init=0;
	always@(addr,data,ld)begin
		if(!init)begin
			r[0]<=20;
			r[1]<=15;
			r[1000]<=150;
			r[1001]<=200;//350
			r[1002]<=116;//466
			r[1003]<=212;//678
			r[1004]<=5;
			r[1005]<=4;
			r[1006]<=3;
			r[1007]<=0;//690
			r[1008]<=1;
			r[1009]<=9;//700
			init<=1;
		end
		if (ld) r[addr]<=data;
		else out<=r[addr];
	end
endmodule
