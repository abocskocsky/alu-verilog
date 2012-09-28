`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:29:09 09/21/2012
// Design Name:   subtract_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/subtract_32bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: subtract_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module subtract_32bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg C_IN;

	// Outputs
	wire [31:0] Z;
	wire C_OUT;

	// Instantiate the Unit Under Test (UUT)
	subtract_32bit uut (
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

		// Wait 100 ns for global reset to finish
		X = 32'b0; Y = 32'b0; C_IN = 32'b0; #100;
		X = 32'b1; Y = 32'b0; C_IN = 32'b0; #100;
		X = 32'b1; Y = 32'b1; C_IN = 32'b0; #100;
		X = 32'b0; Y = 32'b1; C_IN = 32'b0; #100;
		X = 32'b0; Y = 32'b11111111111111111111111111111111; C_IN = 32'b0; #100; // subtract -1
		X = 32'b1; Y = 32'b11111111111111111111111111111111; C_IN = 32'b0; #100; // subtract -1
      X = 32'b0; Y = 32'b0; C_IN = 32'b1; #100;
      X = 32'b0; Y = 32'b1; C_IN = 32'b1; #100;
      X = 32'b1; Y = 32'b11111111111111111111111111111111; C_IN = 32'b1; #100;

	end
      
endmodule

