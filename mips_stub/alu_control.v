`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    alu_control 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(alu_op0,alu_op1,F,op);
	//port definitions
	input  wire alu_op0;
	input  wire alu_op1;
	input  wire [5:0] F;
	output wire [2:0] op;

	assign op[0] = alu_op1 & (F[3] | F[0]);
	assign op[1] = ~alu_op1 | ~F[2];
	assign op[2] = alu_op0 | (F[1] & alu_op1);

endmodule
`default_nettype wire
