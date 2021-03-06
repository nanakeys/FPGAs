`timescale 1ns/10ps

/* Axelou Olympia
 * oaxelou@uth.gr 
 * 2161
 * 
 * ce430
 * Project1: 7-Segment display
 *
 * Part D: 16-char message display circular with a timer
 * 
 * tb.v: the testbench of the partB circuit
 *  
 * Tests the index_counter in fsm: 
 * It sends 2 reset signals with bouncing at posedge and at negedge
 * to test if at reset == 1 the initialization of the counter is ok
 */

module tb;

	reg clk;
	reg reset;

	wire an3,an2,an1,an0;
	wire a,b,c,d,e,f,g,dp;

	initial begin
		clk = 1'b1;

		#100 reset = 1'b1;
		#5 reset = 1'b0;
		#15 reset = 1'b1;
		#5 reset = 1'b0;
		#5 reset = 1'b1;
		#15 reset = 1'b0;
		#5 reset = 1'b1;
		#1000 reset = 1'b0;
		#5 reset = 1'b1;
		#15 reset = 1'b0;
		#5 reset = 1'b1;
		#25 reset = 1'b0;
		#5 reset = 1'b1;
		#5 reset = 1'b0;
		
		#100000;
		
		
		#100 reset = 1'b1;
		#5 reset = 1'b0;
		#15 reset = 1'b1;
		#5 reset = 1'b0;
		#5 reset = 1'b1;
		#15 reset = 1'b0;
		#5 reset = 1'b1;
		#1000 reset = 1'b0;
		#5 reset = 1'b1;
		#15 reset = 1'b0;
		#5 reset = 1'b1;
		#25 reset = 1'b0;
		#5 reset = 1'b1;
		#5 reset = 1'b0;
	end

	always begin
		#10 clk = ~clk;
	end

	FourDigitLEDdriver topLevelinstance(.reset(reset), .clk(clk), 
							.an3(an3), .an2(an2), .an1(an1), .an0(an0), 
							.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .dp(dp));

endmodule
