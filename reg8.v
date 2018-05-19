`timescale 1ns/1ns
module reg8(input[1:0] ra1,ra2,wa,input[7:0] wd,input write,clk,rst,output reg[7:0] rd1,rd2);
	reg[7:0] r[0:3];
	always@(posedge clk,rst)begin
		#1;
		rd1<=r[ra1];
		rd2<=r[ra2];
		#14;
		if(write)r[wa]<=wd;
		begin : RESET
			integer i;
			if(rst)for(i=0;i<4;i=i+1)r[i]<=0;
		end
	end
endmodule
	