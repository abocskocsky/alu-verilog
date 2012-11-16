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
   output wire BranchNEq;
   output wire Jump;
	output wire [2:0] ALUOp;

	wire R;  // r-type
	wire L;  // load type
	wire S;  // store type
	wire B;  // branch type
   wire J;  // jump type
	
	assign R = ~I[31] & ~I[30] & ~I[29] & ~I[28] & ~I[27] & ~I[26]; 
	assign L = I[31] & ~I[30] & ~I[29] & ~I[28] & I[27] & I[26];
	assign S = I[31] & ~I[30] & I[29] & ~I[28] & I[27] & I[26];
	assign B = ~I[31] & ~I[30] & ~I[29] & I[28] & ~I[27];
   assign J = ~I[31] & ~I[30] & ~I[29] & ~I[28] & I[27];
	
	assign RegDst = R;
	assign ALUSrc = L | S;
	assign MemtoReg = L;
	assign RegWrite = R | L;
	assign MemRead = L;
	assign MemWrite = S;
	assign Branch = B;
   assign BranchNEq = B & I[26];
   assign Jump = J | (~(& I[31:26]) & (I[20:0] & 20'b1000));
   // 1st bit: R- or I-type, 2nd bit: branch type, 3rd bit: load or store type
	assign ALUOp = {(~B & ~J & ~L & ~S), B, (L | S)};

endmodule
`default_nettype wire
