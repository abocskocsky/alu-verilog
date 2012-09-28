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
		// Initialize Inputs
		X = 0;
		Y = 0;
		
		// Wait 100 ns for global reset to finish
		X = 32'hffffffff; Y = 32'h10; #100; // move it over halfway
      X = 32'haaaaaaaa; Y = 1; #100; // 1010... to 0101...
      
      X = 32'hffffffff; Y = 32'hffffffff; #100; // shifting by -1...?
      X = 32'hffffffff; Y = 32'hff; #100; // should be all zeros

	end
      
endmodule

