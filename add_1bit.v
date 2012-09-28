`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    add_1bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module add_1bit(X,Y,C_IN,Z,C_OUT);
	//port definitions
	input  wire X;
	input  wire Y;
	input  wire C_IN;
	output wire Z;
	output wire C_OUT;
   
   wire half_sum;
	assign half_sum = X ^ Y;
	assign Z = half_sum ^ C_IN;
	assign C_OUT = X ? (Y | C_IN) : (Y & C_IN);


endmodule
`default_nettype wire
