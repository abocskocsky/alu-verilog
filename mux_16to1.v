`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    mux_16to1 
// Description:    A 16-to-1 mux that uses four bits to choose a particular input.
//
//////////////////////////////////////////////////////////////////////////////////
module mux_16to1(X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,C,R);
   // Parameter for the width of the buses.
   parameter N = 32;
   
	//port definitions
	input  wire [(N-1):0] X1, X2, X3, X4, X5, X6, X7, X8,
                         X9, X10, X11, X12, X13, X14, X15, X16;
	input  wire [3:0]     C;
	output wire [(N-1):0] R;
   
   // Wire together five 4-to-1 muxes: four deciding on the first two bits,
   // and the last one on the final two bits.
   wire [(N-1):0] mux_lsb_0_out, mux_lsb_1_out, mux_lsb_2_out, mux_lsb_3_out;
   mux_4to1 #(.N(N)) MUX_LSB_0 (.W(X1), .X(X2), .Y(X3), .Z(X4), .C(C[1:0]), .R(mux_lsb_0_out));
   mux_4to1 #(.N(N)) MUX_LSB_1 (.W(X5), .X(X6), .Y(X7), .Z(X8), .C(C[1:0]), .R(mux_lsb_1_out));
   mux_4to1 #(.N(N)) MUX_LSB_2 (.W(X9), .X(X10), .Y(X11), .Z(X12), .C(C[1:0]), .R(mux_lsb_2_out));
   mux_4to1 #(.N(N)) MUX_LSB_3 (.W(X13), .X(X14), .Y(X15), .Z(X16), .C(C[1:0]), .R(mux_lsb_3_out));
   mux_4to1 #(.N(N)) MUX_MSB (.W(mux_lsb_0_out), .X(mux_lsb_1_out),
         .Y(mux_lsb_2_out), .Z(mux_lsb_3_out), .C(C[3:2]), .R(R));


endmodule
`default_nettype wire
