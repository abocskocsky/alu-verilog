`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    register_file 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module register_file(cclk,rstb,write,read_reg_0,read_reg_1,write_reg,write_data,reg0,reg1);
	//port definitions
	input  wire cclk;
	input  wire rstb;
	input  wire write;
	input  wire [4:0] read_reg_0;
	input  wire [4:0] read_reg_1;
	input  wire [4:0] write_reg;
	input  wire [31:0] write_data;
	output reg [31:0] reg0;
	output reg [31:0] reg1;
   
   // Hold the state of the register file.
   reg [31:0][31:0] registers;
   
   always @(posedge cclk) begin
      if (~rstb) begin
         reg0 <= 32'b0;
         reg1 <= 32'b0;
      end else begin
         reg0 <= registers[read_reg_0];
         reg1 <= registers[read_reg_1];
         if (write) begin
            registers[write_reg] <= write_data;
         end
      end
   end


endmodule
`default_nettype wire
