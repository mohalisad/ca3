`timescale 1ns/1ns
module mux1(input a,b,s,output w);
	wire w1,w2,ns;
	not(ns,s);
	and(w1,ns,a);
	and(w2,s,b);
	or(w,w1,w2);
endmodule
module mux8(input[7:0] a,input[7:0] b,input s,output[7:0] w);
	genvar i;
	generate for(i=0;i<8;i=i+1) begin
		mux1 t(a[i],b[i],s,w[i]);
	end
	endgenerate
endmodule
module mux13(input[12:0] a,input[12:0] b,input s,output[12:0] w);
	genvar i;
	generate for(i=0;i<13;i=i+1) begin
		mux1 t(a[i],b[i],s,w[i]);
	end
	endgenerate
endmodule
module mux3(input[2:0] a,input[2:0] b,input s,output[2:0] w);
	genvar i;
	generate for(i=0;i<3;i=i+1) begin
		mux1 t(a[i],b[i],s,w[i]);
	end
	endgenerate
endmodule