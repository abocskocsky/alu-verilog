`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    control_unit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module control_unit(I,RegDst,ALUSrc,MemtoReg,RegWrite,MemRead,MemWrite,Branch,ALUOp1,ALUOp2);
	//port definitions
	input  wire [31:0] I;
	output wire RegDst;
	output wire ALUSrc;
	output wire MemtoReg;
	output wire RegWrite;
	output wire MemRead;
	output wire MemWrite;
	output wire Branch;
	output wire ALUOp1;
	output wire ALUOp2;

	wire R;
	wire L;
	wire S;
	wire B;
	
	assign R = ~I[31] & ~I[30] & ~I[29] & ~I[28] & ~I[27] & ~I[26]; 
	assign L = I[31] & ~I[30] & ~I[29] & ~I[28] & I[27] & I[26];
	assign S = I[31] & ~I[30] & I[29] & ~I[28] & I[27] & I[26];
	assign B = ~I[31] & ~I[30] & ~I[29] & I[28] & ~I[27] & ~I[26];
	
	assign RegDst = R;
	assign ALUSrc = L | S;
	assign MemtoReg = L;
	assign RegWrite = R | L;
	assign MemRead = L;
	assign MemWrite = S;
	assign Branch = B;
	assign ALUOp1 = R;
	assign ALUOp2 = B;
	
	
	
endmodule
`default_nettype wire
