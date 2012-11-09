`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:59 11/09/2012
// Design Name:   alu_control
// Module Name:   C:/Documents and Settings/student/My Documents/GitHub/alu-verilog/mips_stub/alu_control_test.v
// Project Name:  mips_stub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu_control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu_control_test;

	// Inputs
	reg alu_op0;
	reg alu_op1;
	reg [5:0] F;

	// Outputs
	wire [2:0] op;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.alu_op0(alu_op0), 
		.alu_op1(alu_op1), 
		.F(F), 
		.op(op)
	);

	initial begin
		// Initialize Inputs
		alu_op0 = 0;
		alu_op1 = 0;
		F = 0;

		// Wait 100 ns for global reset to finish
		#100;
		F = 6'b000000;
		alu_op0 = 0;
		alu_op1 = 0;
		#100;
		alu_op0 = 1;
		#100;
		alu_op1 = 1;
		#1000;
		F = 6'b000000;
		#1000;
		F = 6'b000010;
		#1000;
		F = 6'b000100;
		#1000;
		F = 6'b000101;
		#1000;
		F = 6'b001010;
        
		// Add stimulus here

	end
      
endmodule

