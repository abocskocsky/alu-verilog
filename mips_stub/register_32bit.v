`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    register_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module register_32bit(cclk,rstb,write,data_in,data_out);
	//port definitions
	input  wire cclk;
	input  wire rstb;
	input  wire write;
	input  wire [31:0] data_in;
	output reg [31:0] data_out;
   
   always @(posedge cclk) begin
      if (~rstb) begin
         data_out <= 0;
      end else if (write) begin
         data_out <= data_in;
      end
   end


endmodule
`default_nettype wire
