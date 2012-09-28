`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    mux_2to1 
// Description:    A 2-to-1 mux. It outputs either X or Y depending on the
//                 value of C.
//
//////////////////////////////////////////////////////////////////////////////////
module mux_2to1(X,Y,C,R);
   // Parameter for width of input and output buses.
   parameter N = 32;

   //port definitions
   input  wire [(N-1):0] X, Y;
   input  wire           C;
   output wire [(N-1):0] R;

   // 2-to-1 mux logic: if C then X else Y.
   assign R = C ? Y : X;

endmodule
`default_nettype wire
