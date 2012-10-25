`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    mux_4to1 
// Description:    A 4-to-1 mux, shamelessly based off the Verilog cheat sheet.
//
//////////////////////////////////////////////////////////////////////////////////
module mux_4to1(W,X,Y,Z,C,R);
   // Paramter for the width of buses.
   parameter N = 32;
   
	//port definitions
	input  wire [(N-1):0] W, X, Y, Z;
	input  wire [1:0]     C;
	output wire [(N-1):0] R;
   
   // Wire together three 2-to-1 muxes, with the first two deciding based on
   // the first bit, and the third deciding based on the most significant bit.
   wire [(N-1):0] mux_lsb_0_out, mux_lsb_1_out;
   mux_2to1 #(.N(N)) MUX_LSB_0 (.X(W), .Y(X), .C(C[0]), .R(mux_lsb_0_out));
   mux_2to1 #(.N(N)) MUX_LSB_1 (.X(Y), .Y(Z), .C(C[0]), .R(mux_lsb_1_out));
   mux_2to1 #(.N(N)) MUX_MSB (.X(mux_lsb_0_out), .Y(mux_lsb_1_out), .C(C[1]), .R(R));

endmodule
`default_nettype wire
