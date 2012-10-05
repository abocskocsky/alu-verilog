`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:51:08 09/28/2012
// Design Name:   shift_left_1bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/shift_left_1bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_left_1bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_left_1bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [31:0] I;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	shift_left_1bit uut (
		.X(X), 
		.Y(Y), 
		.I(I), 
		.Z(Z)
	);

	initial begin
      X = 32'b1010; Y = 0; I = 0; #100;
      X = 32'b1010; Y = 0; I = 1; #100;
      X = 32'b1010; Y = 1; I = 0; #100;
      X = 32'b1010; Y = 1; I = 2; #100;
      X = 32'b1010; Y = 35; I = 1; #100;
      // These will shift by negative amounts because the logic which makes
      // sure Y is handled as unsigned happens in the 32-bit shifter.
      X = 32'b1010; Y = 32'hffffffff; I = 0; #100;
      X = 32'b1010; Y = 32'hffffffff; I = 1; #100;
      // Should result in 00000000
      X = 32'b1010; Y = 32'h7fffffff; I = 0; #100;
      X = 32'b1010; Y = 32'h7fffffff; I = 1; #100;

	end
      
endmodule

