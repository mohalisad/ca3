`timescale 1ns/1ns
module TB();
	logic clk=0;
	logic rst=0;
	main m(clk,rst);
	initial #5 rst=1;
	initial #30 rst=0;
	initial repeat (800) #50 clk=~clk;
	initial #22800 $stop;
endmodule
