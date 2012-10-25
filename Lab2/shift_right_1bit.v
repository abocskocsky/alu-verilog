`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    shift_right_1bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_right_1bit(X,Y,I,V,Z);
	//port definitions
	input  wire [31:0] X, Y, I;
   input  wire V;
	output wire Z;

// j = i + Y; if j < 31: Z[i] = X[j]; else Z[i] = 0
   wire [31:0] index;
   wire lt32, gte0, temp;
   add_32bit ADD (.X(I), .Y(Y), .Z(index), .C_IN(1'b0), .C_OUT(temp));
   set_less_than_32bit LT32 (.X(index), .Y(32'd32), .Z(lt32));
   set_less_than_32bit GTE0 (.X(32'hffffffff), .Y(index), .Z(gte0));
   assign Z = (lt32 & gte0) ? X[index] : V;

endmodule
`default_nettype wire
