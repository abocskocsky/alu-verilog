`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:14:02 11/08/2012
// Design Name:   bit_extender
// Module Name:   C:/Documents and Settings/student/My Documents/GitHub/alu-verilog/mips_stub/bit_extender_test.v
// Project Name:  mips_stub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bit_extender
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bit_extender_test;

	// Inputs
	reg [15:0] X;

	// Outputs
	wire [31:0] Z;

	// Instantiate the Unit Under Test (UUT)
	bit_extender uut (
		.X(X), 
		.Z(Z)
	);

	initial begin
		X = 16'b0000000000001111;
		
		// Test cases
      #100;
 		X = 16'b0000000000001111;
		#100;
		X = 16'b1000000000001111;

	end
endmodule

