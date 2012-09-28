`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:33:10 09/21/2012
// Design Name:   mux_2to1
// Module Name:   /home/bhood/.Xilinx/workspace/ByronHoodPreLab2/test_mux_2to1.v
// Project Name:  ByronHoodPreLab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_2to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux_2to1;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg C;

	// Outputs
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	mux_2to1 uut (
		.X(X), 
		.Y(Y), 
		.C(C), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		X = 1; Y = 2; C = 0; #100;
      X = 3; Y = 4; C = 1; #100;
        
		// Add stimulus here

	end
      
endmodule

