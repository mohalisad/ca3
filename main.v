`timescale 1ns/1ns
module main(input clk,rst);
	reg c,z,n;
	reg[4:0] di;
	reg[12:0] tr;
	reg[3:0] opr;
	reg halt;
	wire[12:0] pc,npc,pcinc;
	wire[7:0] inst;
	wire[7:0] n1,n2,y,rd2,dout;
	wire[1:0] ra1,ra2,wa;
	wire[2:0] alu_cont;
	wire cout,zero;
	wire jmp;
	wire[5:0] s;
	jmpchk checker(s[4],di[2:1],z,c,n,jmp);
	pcreg mypcreg(npc,clk,rst,pc);
	pcadder pa(pc,pcinc);
	mux13 mymux4(pcinc,tr,jmp,npc);
	instructreg myinstreg(pc,rst,inst);
	ALU myalu(alu_cont,n1,n2,c,clk,y, cout,zero);
	mux8 mmux1(di[4:3],inst[1:0],s[0],ra1);
	reg8 myreg8(ra1,inst[3:2],wa,y,s[2],clk,rst,n1,rd2);
	mux8 mmux2(dout,rd2,s[1],n2);
	mux8 mmux3(di[4:3],inst[3:2],s[5],wa);
	datareg mydatareg(tr,y,s[3],dout);
	always@(posedge clk,rst)begin
		#1;
		if(clk)begin
			opr<=inst[7:4];
			if(halt)begin
				halt<=0;
				tr[7:0]<=inst[7:0];
			end else if((!inst[7])||inst[7:5]==6)begin
				halt<=1;
				opr<={1'b0,inst[7:5]};
				tr[12:8]<=inst[4:0];
			end
			if(inst[7:5]==3'b111)di<=inst[4:0];
		end
		if(rst)begin
			di<=0;
			tr<=0;
			halt<=0;
			c<=0;
			z<=0;
			n<=0;
		end
	end
endmodule