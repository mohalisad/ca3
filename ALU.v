`timescale 1ns/1ns
module ALU(input[2:0] cont,input[7:0] a,b,input cin,clk,output reg[7:0] y, output reg cout,output zero);
	nor(zero,y[0],y[1],y[2],y[3],y[4],y[5],y[6],y[7]);
	always @(posedge clk) begin
		#6;
		case (cont[2:0])
			3'b000:{cout,y}=a+b+cin;
			3'b001:{cout,y}=a&b;
			3'b010:{cout,y}=a|b;
			3'b011:y<=a;
			3'b100:y<=b;
		endcase
	end
endmodule
