`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    bit_extender 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module bit_extender(X,Z);
	//port definitions
	input wire [15:0] X;
	output wire [31:0] Z;
	wire [31:0] T;
	
	assign T[15:0] = X[15:0];
	assign T[31] = X[15];
	assign T[30] = X[15];
	assign T[29] = X[15];
	assign T[28] = X[15];
	assign T[27] = X[15];
	assign T[26] = X[15];
	assign T[25] = X[15];
	assign T[24] = X[15];
	assign T[23] = X[15];
	assign T[22] = X[15];
	assign T[21] = X[15];
	assign T[20] = X[15];
	assign T[19] = X[15];
	assign T[18] = X[15];
	assign T[17] = X[15];
	assign T[16] = X[15];
	assign Z = T;

endmodule
`default_nettype wire
