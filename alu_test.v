`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:19 09/28/2012
// Design Name:   alu
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/alu_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define NUM_TEST_VALUES 25
`define MAX_OP_CODE 4'd10
`define OP_AND 4'b0000
`define OP_OR  4'b0001
`define OP_XOR 4'b0010
`define OP_NOR 4'b0011
`define OP_ADD 4'b0101
`define OP_SUB 4'b0110
`define OP_SLT 4'b0111
`define OP_SRL 4'b1000
`define OP_SLL 4'b1001
`define OP_SRA 4'b1010

module alu_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [3:0] op_code;

	// Outputs
	wire [31:0] Z;
	wire overflow;
	wire equal;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.X(X), 
		.Y(Y), 
		.op_code(op_code), 
		.Z(Z), 
		.overflow(overflow), 
		.equal(equal), 
		.zero(zero)
	);

	initial begin
		X = 0; Y = 0; op_code = 0;
		for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10;
		end
      
      X = 1; Y = 2;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10;
		end
	end
      
endmodule

