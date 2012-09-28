`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:49:22 09/27/2012
// Design Name:   shift_right_logical_1bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/shift_right_logical_1bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_right_logical_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_right_1bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [31:0] i;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	shift_right_1bit uut (
		.X(X), 
		.Y(Y), 
		.i(i), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		i = 0;

		// Wait 100 ns for global reset to finish
      X = 32'b1010; Y = 1; I = 0; V = 0; #100;
      X = 32'b1010; Y = 2; I = 0; V = 0; #100;
      X = 32'b1010; Y = 7; I = 0; V = 1; #100;
      X = 32'b1010; Y = 35; I = 0; V = 0; #100;

	end
      
endmodule

