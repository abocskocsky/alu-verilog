`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:58:50 11/19/2012
// Design Name:   alu_control
// Module Name:   C:/Documents and Settings/student/My Documents/GitHub/alu-verilog/mips_stub/test_alu_control.v
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

module test_alu_control;

	// Inputs
	reg [2:0] alu_op;
	reg [5:0] F;

	// Outputs
	wire [3:0] op;

	// Instantiate the Unit Under Test (UUT)
	alu_control uut (
		.alu_op(alu_op), 
		.F(F), 
		.op(op)
	);

	initial begin
	// Initialize Inputs
		alu_op = 3'b000;
		F = 6'b000000;
		// Wait 100 ns for global reset to finish
		alu_op = 3'b001;
		#100;
		F = 6'b001100;// 0000
		#100;
		F = 6'b100000;// and:        0000
		#100;
		F = 6'b100101;// or:         0001
		#100;
		F = 6'b001101;// ori:        0001
		#100;
		F = 6'b001110;// xori:       0001
		#100;		
		F = 6'b100110;// xor:        0010
		#100;
		F = 6'b100111;// nor:        0011
		#100;
		F = 6'b100000;// add:        0101
		#100;
		F = 6'b001000;// addi:       0101
		#1000;
		F = 6'b100010;// sub:        0110
		#100;
		F = 6'b101010;// slt:        0111
		#100;
		F = 6'b001010;// slti:       0111
		#100;
		F = 6'b000000;// sll:        1001
		#100;
		F = 6'b000011;// sra:        1010
		#100;
		F = 6'b000010;// srl:        1000	
		#100;
		
		alu_op = 3'b010;
		
		F = 6'b000100;// beq:        0110
		#100;
		F = 6'b000101;// bne:        0110
		#100;
		
		alu_op = 3'b100;
		#100;
		// lw         0101
		// sw:         0101
		$finish;

	end
      
endmodule

