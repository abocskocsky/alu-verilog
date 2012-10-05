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
		.I(i), 
		.Z(Z)
	);

	initial begin
      X = 32'b1010; Y = 0; I = 0; V = 0; #100;
      X = 32'b1010; Y = 0; I = 1; V = 0; #100;
      X = 32'b1010; Y = 1; I = 0; V = 0; #100;
      X = 32'b1010; Y = 1; I = 2; V = 0; #100;
      X = 32'b1010; Y = 35; I = 1; V = 0; #100;
      // These will shift by negative amounts because the logic which makes
      // sure Y is handled as unsigned happens in the 32-bit shifter.
      X = 32'b1010; Y = 32'hffffffff; I = 0; V = 0; #100;
      X = 32'b1010; Y = 32'hffffffff; I = 1; V = 0; #100;
      // Should result in 00000000 and 11111111, respectively
      X = 32'b1010; Y = 32'h7fffffff; I = 0; V = 0; #100;
      X = 32'b1010; Y = 32'h7fffffff; I = 1; V = 1; #100;
	end
      
endmodule

