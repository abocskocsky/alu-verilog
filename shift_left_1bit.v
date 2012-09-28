`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    shift_left_1bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_left_1bit(X,Y,I,Z);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	input  wire [31:0] I;
	output wire Z;

// j = i - Y; if j < 0: Z[i] = 0; else Z[i] = X[j];
   wire [31:0] index;
   wire lt0, temp;
   subtract_32bit SUB (.X(I), .Y(Y), .Z(index), .C_IN(1'b0), .C_OUT(temp));
   set_less_than_32bit SLT (.X(index), .Y(32'd0), .Z(lt0));
   assign Z = lt0 ? 1'b0 : X[index];

endmodule
`default_nettype wire
