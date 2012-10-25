`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:13:02 09/28/2012
// Design Name:   add_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/add_32bit_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: add_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module add_32bit_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg C_IN;

	// Outputs
	wire [31:0] Z;
	wire C_OUT;

	// Instantiate the Unit Under Test (UUT)
	add_32bit uut (
		.X(X), 
		.Y(Y), 
		.C_IN(C_IN), 
		.Z(Z), 
		.C_OUT(C_OUT)
	);

	initial begin
		// Test 0, +/-1, N-1, and N, where N is the largest +/- 32-bit integer.
      X = 32'h0; Y = 32'h0; C_IN = 1'b0; #10;
      X = 32'h1; Y = 32'h0; C_IN = 1'b0; #10;
      X = 32'h0; Y = 32'h1; C_IN = 1'b1; #10;
      X = 32'h1; Y = 32'h1; C_IN = 1'b1; #10;
      X = 32'hffffffff; Y = 32'h0; C_IN = 1'b0; #10;
      X = 32'h0; Y = 32'hffffffff; C_IN = 1'b1; #10;
      X = 32'hffffffff; Y = 32'hffffffff; C_IN = 1'b0; #10;
      X = 32'h1; Y = 32'hffffffff; C_IN = 1'b0; #10;
      X = 32'hffffffff; Y = 32'h1; C_IN = 1'b0; #10;
      X = 32'hffffffff; Y = 32'h2; C_IN = 1'b0; #10;
      X = 32'b0011; Y = 32'b1100; C_IN = 1'b0; #100;
      X = 32'b0001; Y = 32'b1111; C_IN = 1'b0; #100;
      X = 32'hffffffff; Y = 32'h7fffffff; C_IN = 1'b0; #10;
      X = 32'h80000000; Y = 32'h7ffffffe; C_IN = 1'b0; #10;
      X = 32'h80000000; Y = 32'h1; C_IN = 1'b0; #10;
      X = 32'h7fffffff; Y = 32'h1; C_IN = 1'b0; #10;
      X = 32'h7fffffff; Y = 32'h7fffffff; C_IN = 1'b0; #10;
      X = 32'h7ffffffe; Y = 32'h1; C_IN = 1'b1; #10;

	end
      
endmodule

