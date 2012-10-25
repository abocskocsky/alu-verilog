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
		X = 0; Y = 0; #10; // false
      X = 0; Y = 1; #10; // true
      X = 1; Y = 0; #10; // false
      X = 0; Y = 32'hffffffff; #10; // false
      X = 32'h8429842f; Y = 32'h22feabc3; #10; // true
      X = 32'h22feabc3; Y = 32'h8429842f; #10; // false
      X = 32'h23498723; Y = 32'h22feabc3; #10; // false
      X = 32'h8429842f; Y = 32'h87234234; #10; // true
      X = 32'hffffffff; Y = 32'hffffffff; #10; // false
      X = 32'hfffffffe; Y = 32'hffffffff; #10; // true
      X = 32'h7fffffff; Y = 32'hffffffff; #10; // false
      X = 32'hffffffff; Y = 32'h70ffffff; #10; // true
	end
      
endmodule

