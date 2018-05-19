`timescale 1ns/1ns
module shifter(input[7:0] in,input[2:0] count,input right,rotate,output reg co,output reg[7:0] out);
	always@(in,count,right,rotate)begin
		out<=in;
		if(right)begin:shr
			integer i;
			for(i=0;i<count;i=i+1)begin
				co<=out[7:1];
				#1 out<={rotate?out[0]:1'b0,out[7:1]};
			end
		end
		else begin:shl
			integer i;
			for(i=0;i<count;i=i+1)begin
				co<=out[7:1];
				#1 out<={out[6:0],rotate?out[7]:1'b0};
			end
		end
	end
endmodule