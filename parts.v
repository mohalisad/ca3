`timescale 1ns/1ns
module part1(input[18:0] in,input clk,rst,output reg Z,output reg C);
	wire [2:0] ra2;
	wire [7:0] wd,rd1,rd2,_rd2,y1,y2,y3,o1,o2;
	wire write,ra2s,s1,s2;
	wire cout,zero;
	wire shiftco;
	wire[7:0] addr;
	wire ld;
	mux3 mymux1 (in[7:5],in[13:11],ra2s,ra2);//LDM STM
	reg8 myreg(in[10:8],ra2,in[13:11],wd,write,clk,rst,rd1,_rd2);
	mux8 mymux2(_rd2,in[7:0], in[17],rd2);
	ALU myalu(in[16:14],rd1,rd2,C,clk,y1, cout,zero);
	//LDM STM
	datareg_controller dc1(rd1,in[7:0],in[18:14],clk,addr,ld);
	datareg dr1(addr,_rd2,ld,y2);
	//SHIFT
	shifter sh1(rd1,in[7:5],in[14],in[15],shiftco,y3);
	//
	mux8 mymux3(y1,y2, s1,o1);
	mux8 mymux4(y2,y3, s1,o2);
	mux8 mymux5(o1,o2, s2,wd);
	//
	controller mc(in,clk,write,ra2s,s1,s2);
	always@(in,rst)begin
		if(!in[18])begin
			#5;
			C<=cout;
			Z<=zero;
		end
		if(in[18:16]==6)begin
			#5;
			if(y3==0)
				Z<=1;
			else
				Z<=0;
			C<=shiftco;
		end
		if(rst)begin
			C<=0;
			Z<=0;
		end
		if(in==0)begin
			C<=0;
			Z<=0;
		end
	end
endmodule
module part2(input[11:0] pc,input clk,rst,output reg[11:0] npc);
	wire [18:0] instruction;
	wire [11:0] npc1,spop;
	wire z,c;
	reg push=0,pop=0;
	reg co;
	reg [11:0]npc2,npc3;
	reg check;
	instructreg ir(pc,rst,instruction);
	part1 p1(instruction,clk,rst,z,c);
	pcadder pa1(pc,npc1);
	stack mystack1(npc1,rst,push,pop,spop);
	always@(posedge clk,negedge rst)begin
		#1;
		npc<=npc1;
		if(instruction[18:16]==5)begin
			check<=0;
			case(instruction[15:14])
				2'b00:if(z)check<=1;
				2'b01:if(!z)check<=1;
				2'b10:if(c)check<=1;
				2'b11:if(!c)check<=1;
			endcase
			#1;
			if(check==1)
				#1 {co,npc2}=npc1+instruction[7:0];
			else
				#1 npc2<=npc1;
			#1 npc<=npc2;
		end
		if(instruction[18:16]==7)begin
			if(instruction[15]==0)begin
				npc3<=instruction[11:0];
				if(instruction[14]==1)begin
					push<=1;
					#5 push<=0;
				end
				#1 npc<=npc3;
			end else begin 
				pop<=1;
				#5 pop<=0;
				npc<=spop;
			end
		end
	end
endmodule