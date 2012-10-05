`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:00:45 09/21/2012
// Design Name:   subtract_1bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/subtract_1bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subtract_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module subtract_1bit_test;

	// Inputs
	reg X;
	reg Y;
	reg C_IN;

	// Outputs
	wire Z;
	wire C_OUT;

	// Instantiate the Unit Under Test (UUT)
	subtract_1bit uut (
		.X(X), 
		.Y(Y), 
		.C_IN(C_IN), 
		.Z(Z), 
		.C_OUT(C_OUT)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		C_IN = 0;

		// Try all the combinations.
		X = 0; Y = 0; C_IN = 0; #100;
      X = 0; Y = 0; C_IN = 1; #100;
      X = 0; Y = 1; C_IN = 0; #100;
      X = 0; Y = 1; C_IN = 1; #100;
      X = 1; Y = 0; C_IN = 0; #100;
      X = 1; Y = 0; C_IN = 1; #100;
      X = 1; Y = 1; C_IN = 0; #100;
      X = 1; Y = 1; C_IN = 1; #100;

	end
      
endmodule

