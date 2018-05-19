`timescale 1ns/1ns
module controller(input[3:0] opr,input clk,halt,output reg[2:0] alu_cont,output reg[5:0] s);
	always@(posedge clk)begin
		s<=0;
		#2;
		if(halt)s<=0;
		else case(opr)begin
			4'b0000:begin alu_cont<=3'b100;s<=6'b000100; end
			4'b0001:begin alu_cont<=3'b011;s<=6'b001000; end
			4'b0010:begin alu_cont<=3'b000;s<=6'b000100; end
			4'b0011:begin alu_cont<=3'b001;s<=6'b000100; end
			4'b1000:begin alu_cont<=3'b011;s<=6'b100011; end
			4'b1001:begin alu_cont<=3'b000;s<=6'b100011; end
			4'b1010:begin alu_cont<=3'b001;s<=6'b100011; end
			4'b0110:begin alu_cont<=3'b000;s<=6'b010000; end
			4'b0111:begin alu_cont<=3'b000;s<=6'b000000; end
		end
	end
endmodule