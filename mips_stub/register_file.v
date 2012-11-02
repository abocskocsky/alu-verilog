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
   
   reg [31:0][31:0] registers;
   
   wire [31:0][31:0] _out;
   wire [31:0] write_reg_index, read_reg_0_index, read_reg_1_index;
        
   decoder_32bit WRITE_DECODER (.C(write_reg), .R(write_reg_index));
   decoder_32bit REG0_DECODER (.C(read_reg_0), .R(read_reg_0_index));
   decoder_32bit REG1_DECODER (.C(read_reg_1), .R(read_reg_1_index));
   
   always @(posedge cclk) begin
      if (~rstb) begin
         reg0 <= 32'b0;
         reg1 <= 32'b0;
      end else begin
         reg0 <= registers[read_reg_0_index];
         reg1 <= registers[read_reg_1_index];
         if (write) begin
            registers[write_reg_index] <= write_data;
         end
      end
   end


endmodule
`default_nettype wire
