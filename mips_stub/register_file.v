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
	output wire [31:0] reg0;
	output wire [31:0] reg1;
   
   // Hold the state of the register file.
   reg [31:0] registers[31:0];
   
   assign reg0 = registers[read_reg_0];
   assign reg1 = registers[read_reg_1];
   
   always @(posedge cclk) begin
      if (~rstb) begin
         registers[0] <= 32'b0;
         registers[1] <= 32'b0;
         registers[2] <= 32'b0;
         registers[3] <= 32'b0;
         registers[4] <= 32'b0;
         registers[5] <= 32'b0;
         registers[6] <= 32'b0;
         registers[7] <= 32'b0;
         registers[8] <= 32'b0;
         registers[9] <= 32'b0;
         registers[10] <= 32'b0;
         registers[11] <= 32'b0;
         registers[12] <= 32'b0;
         registers[13] <= 32'b0;
         registers[14] <= 32'b0;
         registers[15] <= 32'b0;
         registers[16] <= 32'b0;
         registers[17] <= 32'b0;
         registers[18] <= 32'b0;
         registers[19] <= 32'b0;
         registers[20] <= 32'b0;
         registers[21] <= 32'b0;
         registers[22] <= 32'b0;
         registers[23] <= 32'b0;
         registers[24] <= 32'b0;
         registers[25] <= 32'b0;
         registers[26] <= 32'b0;
         registers[27] <= 32'b0;
         registers[28] <= 32'b0;
         registers[29] <= 32'b0;
         registers[30] <= 32'b0;
         registers[31] <= 32'b0;
      end else begin
         if (write) begin
            registers[write_reg] <= write_data;
         end
      end
   end


endmodule
`default_nettype wire
