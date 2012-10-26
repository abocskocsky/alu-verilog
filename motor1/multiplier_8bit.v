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
   input wire cclk;
	input wire [7:0] X;
	input wire [7:0] Y;
	output reg [15:0] Z;
   
   wire [7:0] mX = X[7] ? ~X + 1 : X;
   wire [7:0] mY = Y[7] ? ~Y + 1 : Y;
   wire sign = X[7] ^ Y[7];

   // Multiply by each bit, then shift and accumulate.
   always @(posedge cclk) begin
      if (sign) begin
         Z <= ~((mY[0] ? mX : 16'b0) +
                (mY[1] ? mX << 1 : 16'b0) +
                (mY[2] ? mX << 2 : 16'b0) +
                (mY[3] ? mX << 3 : 16'b0) +
                (mY[4] ? mX << 4 : 16'b0) +
                (mY[5] ? mX << 5 : 16'b0) +
                (mY[6] ? mX << 6 : 16'b0) +
                (mY[7] ? mX << 7 : 16'b0)) + 1;
       end else begin
         Z <= (mY[0] ? mX : 16'b0) +
              (mY[1] ? mX << 1 : 16'b0) +
              (mY[2] ? mX << 2 : 16'b0) +
              (mY[3] ? mX << 3 : 16'b0) +
              (mY[4] ? mX << 4 : 16'b0) +
              (mY[5] ? mX << 5 : 16'b0) +
              (mY[6] ? mX << 6 : 16'b0) +
              (mY[7] ? mX << 7 : 16'b0);
       end
   end

endmodule
`default_nettype wire
