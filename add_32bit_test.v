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
		// Initialize Inputs
		X = 0;
		Y = 0;
		C_IN = 0;

		// Wait 100 ns for global reset to finish
      X = 32'b00000; Y = 32'b000000; #100;
      X = 32'b00001; Y = 32'b000001; #100;
      X = 32'b111111111111111111111111111111111; Y = 32'b111111111111111111111111111111111; #100;
      X = 32'b00011; Y = 32'b001100; #100;
      X = 32'b00001; Y = 32'b001111; #100;
      X = 32'b011111111111111111111111111111111; Y = 32'b0000001; #100;
        
		// Add stimulus here

	end
      
endmodule

