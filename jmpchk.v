`timescale 1ns/1ns
module jmpchk(input enable,input[1:0] di,input z,c,n,output jmp);
	supply1 vcc;
	wire out,w1,w2;
	and(jmp,out,enable);
	mux1 m1(vcc,c,di[0],w1);
	mux1 m2(z,n,di[0],w2);
	mux1 m3(w1,w2,di[1],out);
endmodule
	