`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    set_less_than_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module set_less_than_32bit(X,Y,Z);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire Z;

   // If the signs of X and Y differ, the answer is already determined for us:
   // return 1 if X's sign bit is set, 0 otherwise.
   // If not, then subtract Y from X. If the result is less than zero, Y > X,
   // regardless of whether X and Y are positive or negative.
   wire sign_bit_xor, null;
   wire [31:0] subtract_result;
   assign sign_bit_xor = X[31] ^ Y[31];
   subtract_32bit SUB1 (.X(X), .Y(Y), .Z(subtract_result), .C_IN(1'b0), .C_OUT(null));
	
   assign Z = sign_bit_xor ? X[31] : subtract_result[31];

endmodule
`default_nettype wire
