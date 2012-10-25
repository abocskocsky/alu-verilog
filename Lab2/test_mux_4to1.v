`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:30:26 09/21/2012
// Design Name:   mux_4to1
// Module Name:   /home/bhood/.Xilinx/workspace/ByronHoodPreLab2/test_mux_4to1.v
// Project Name:  ByronHoodPreLab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_4to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux_4to1;

	// Inputs
	reg [31:0] W;
	reg [31:0] X;
	reg [31:0] Y;
	reg [31:0] Z;
	reg [1:0] C;

	// Outputs
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	mux_4to1 uut (
		.W(W), 
		.X(X), 
		.Y(Y), 
		.Z(Z), 
		.C(C), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		W = 0;
		X = 0;
		Y = 0;
		Z = 0;
		C = 0;

		// Wait 100 ns for global reset to finish
		W = 1; X = 0; Y = 0; Z = 0; C = 0; #100;
      W = 314; X = 159; Y = 265; Z = 0; C = 2; #100;
        
		// Add stimulus here

	end
      
endmodule

