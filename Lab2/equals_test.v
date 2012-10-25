`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:25:10 09/28/2012
// Design Name:   equals
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/equals_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: equals
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module equals_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	equals uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;

		// Wait 100 ns for global reset to finish
		X = 0; Y = 0; #100;
      X = 1; Y = 0; #100;
      X = 32'hffffffff; Y = 32'hff7fffff; #100;

	end
      
endmodule

