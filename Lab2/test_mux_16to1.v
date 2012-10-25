`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:00:30 09/21/2012
// Design Name:   mux_16to1
// Module Name:   /home/bhood/.Xilinx/workspace/ByronHoodPreLab2/test_mux_16to1.v
// Project Name:  ByronHoodPreLab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux_16to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_mux_16to1;

	// Inputs
	reg [31:0] X1;
	reg [31:0] X2;
	reg [31:0] X3;
	reg [31:0] X4;
	reg [31:0] X5;
	reg [31:0] X6;
	reg [31:0] X7;
	reg [31:0] X8;
	reg [31:0] X9;
	reg [31:0] X10;
	reg [31:0] X11;
	reg [31:0] X12;
	reg [31:0] X13;
	reg [31:0] X14;
	reg [31:0] X15;
	reg [31:0] X16;
	reg [3:0] C;

	// Outputs
	wire [31:0] R;

	// Instantiate the Unit Under Test (UUT)
	mux_16to1 uut (
		.X1(X1), 
		.X2(X2), 
		.X3(X3), 
		.X4(X4), 
		.X5(X5), 
		.X6(X6), 
		.X7(X7), 
		.X8(X8), 
		.X9(X9), 
		.X10(X10), 
		.X11(X11), 
		.X12(X12), 
		.X13(X13), 
		.X14(X14), 
		.X15(X15), 
		.X16(X16), 
		.C(C), 
		.R(R)
	);

	initial begin
		// Initialize Inputs
		#100; X1 = 1; X2 = 0; X3 = 0; X4 = 0; X5 = 0; X6 = 0; X7 = 0; X8 = 0; X9 = 0; X10 = 0; X11 = 0; X12 = 0; X13 = 0; X14 = 0; X15 = 0; X16 = 0; C = 0;
      #100; X1 = 1; X2 = 0; X3 = 0; X4 = 0; X5 = 0; X6 = 42; X7 = 0; X8 = 0; X9 = 0; X10 = 0; X11 = 0; X12 = 0; X13 = 0; X14 = 0; X15 = 0; X16 = 0; C = 5;

	end
      
endmodule

