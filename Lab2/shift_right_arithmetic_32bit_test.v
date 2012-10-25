`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:56:35 09/28/2012
// Design Name:   shift_right_arithmetic_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/shift_right_arithmetic_32bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_right_arithmetic_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_right_arithmetic_32bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	shift_right_arithmetic_32bit uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		X = 32'h7fffffff; Y = 32'h10; #100; // move it over just past halfway
      X = 32'haaaaaaaa; Y = 1; #100; // 1010... to 110101...
      
      X = 32'h7fffffff; Y = 32'hffffffff; #100; // shifting by -1 -> unsigned
      X = 32'hffffffff; Y = 32'hff; #100; // should be all zeros
      
      X = 32'hffffffff; Y = 32'h1; #100; // edge case: should be all zeros
      X = 32'h80000000; Y = 32'h1; #100; // ==> divide by 2
	end
      
endmodule

