`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:17:57 09/28/2012
// Design Name:   set_less_than_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/set_less_than_32bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: set_less_than_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module set_less_than_32bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;

	// Outputs
	wire Z;

	// Instantiate the Unit Under Test (UUT)
	set_less_than_32bit uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		// Initialize Inputs
		X = 0;
		Y = 0;

		// Wait 100 ns for global reset to finish
		X = 0; Y = 0; #100; // false
      X = 0; Y = 1; #100; // true
      X = 0; Y = 32'hffffffff; #100; // false
      X = 32'hfffffffe; Y = 32'hffffffff; #100; // true
      X = 1; Y = 0; #100; // false
      X = 32'h7fffffff; Y = 32'hffffffff; #100; // false
      X = 32'hffffffff; Y = 32'h70ffffff; #100; // true
        
		// Add stimulus here

	end
      
endmodule

