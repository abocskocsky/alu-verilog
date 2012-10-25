`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    subtract 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module subtract_1bit(
   X,
   Y,
   C_IN,
   Z,
   C_OUT
);
	//port definitions
	input  wire X;
	input  wire Y;
	input  wire C_IN;
	output wire Z;
	output wire C_OUT;
   
   // Assignments to output. We use complex expressions in place of explicit
   // temporaries where 
   assign Z = (X^Y)^C_IN;
   assign C_OUT = X ? (Y & C_IN) : (Y | C_IN);

endmodule
`default_nettype wire
