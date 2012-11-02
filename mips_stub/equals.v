`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    equals 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module equals(X,Y,Z);
   // set the parameter for the width of this equals
   parameter N = 32;
   
	//port definitions
	input  wire [(N-1):0] X, Y;
	output wire Z;

   wire [(N-1):0] xnor_result;
   assign xnor_result = ~(X ^ Y); // XNOR tests if bits are equal
   assign Z = & xnor_result; // return 1 if all bits were equal

endmodule
`default_nettype wire
