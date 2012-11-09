`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:34:35 11/09/2012
// Design Name:   control_unit
// Module Name:   C:/Documents and Settings/student/My Documents/GitHub/alu-verilog/mips_stub/control_unit_test.v
// Project Name:  mips_stub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: control_unit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module control_unit_test;

	// Inputs
	reg [31:0] I;

	// Outputs
	wire RegDst;
	wire ALUSrc;
	wire MemtoReg;
	wire RegWrite;
	wire MemRead;
	wire MemWrite;
	wire Branch;
	wire ALUOp1;
	wire ALUOp2;

	// Instantiate the Unit Under Test (UUT)
	control_unit uut (
		.I(I), 
		.RegDst(RegDst), 
		.ALUSrc(ALUSrc), 
		.MemtoReg(MemtoReg), 
		.RegWrite(RegWrite), 
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.Branch(Branch), 
		.ALUOp1(ALUOp1), 
		.ALUOp2(ALUOp2)
	);

	initial begin
		// Initialize Inputs
		I = 32'b00000000000000000000000000000000;
		#100;
		I = 32'b00000000000000000000000000000000;
		#100;
      I = 32'b10001100000000000000000000000000;
		#100;
		I = 32'b10101100000000000000000000000000;
		#100;
		I = 32'b00010000000000000000000000000000;
		#100;		
		// Add stimulus here

	end
      
endmodule

