`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:38:19 09/28/2012
// Design Name:   shift_right_logical_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/shift_right_logical_32bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shift_right_logical_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shift_right_logical_32bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	shift_right_logical_32bit uut (
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

	initial begin
		X = 32'hffffffff; Y = 32'h10; #100; // move it over halfway
      X = 32'haaaaaaaa; Y = 1; #100; // 1010... to 0101...
      
      X = 32'hffffffff; Y = 32'hffffffff; #100; // shifting by -1 -> should be unsigned
      X = 32'hffffffff; Y = 32'hff; #100; // should be all zeros
      
      X = 0; Y = 32'h7fffffff; #100;

	end
      
endmodule

