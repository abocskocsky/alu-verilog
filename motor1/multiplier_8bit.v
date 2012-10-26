`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    multiplier 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier_8bit(cclk, X, Y, Z);   
	// Inputs and outputs.
   input  wire cclk;
	input  reg [7:0] X;
	input  reg [7:0] Y;
	output reg [15:0] Z;

   // Multiply by each bit, then shift and accumulate.
   always @(posedge cclk) begin
      Z <= (Y[0] ? X : 16'b0) +
           (Y[1] ? X << 1 : 16'b0) +
           (Y[2] ? X << 2 : 16'b0) +
           (Y[3] ? X << 3 : 16'b0) +
           (Y[4] ? X << 4 : 16'b0) +
           (Y[5] ? X << 5 : 16'b0) +
           (Y[6] ? X << 6 : 16'b0) +
           (Y[7] ? X << 7 : 16'b0);
   end

endmodule
`default_nettype wire
