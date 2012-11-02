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
   
   wire [31:0] r0_out, r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out,
               r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out,
               r16_out, r17_out, r18_out, r19_out; r20_out, r21_out, r22_out, r23_out,
               r24_out, r25_out, r26_out, r27_out, r28_out, r29_out, r30_out, r31_out;
   
   // The 32-count 32-bit registers in this register file.
   register_32bit REG0 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r0_out));
   register_32bit REG1 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r1_out));
   register_32bit REG2 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r2_out));
   register_32bit REG3 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r3_out));
   register_32bit REG4 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r4_out));
   register_32bit REG5 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r5_out));
   register_32bit REG6 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r6_out));
   register_32bit REG7 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r7_out));
   register_32bit REG8 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r8_out));
   register_32bit REG9 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r9_out));
   register_32bit REG10 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r10_out));
   register_32bit REG11 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r11_out));
   register_32bit REG12 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r12_out));
   register_32bit REG13 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r13_out));
   register_32bit REG14 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r14_out));
   register_32bit REG15 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r15_out));
   register_32bit REG16 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r16_out));
   register_32bit REG17 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r17_out));
   register_32bit REG18 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r18_out));
   register_32bit REG19 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r19_out));
   register_32bit REG20 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r20_out));
   register_32bit REG21 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r21_out));
   register_32bit REG22 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r22_out));
   register_32bit REG23 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r23_out));
   register_32bit REG24 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r24_out));
   register_32bit REG25 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r25_out));
   register_32bit REG26 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r26_out));
   register_32bit REG27 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r27_out));
   register_32bit REG28 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r28_out));
   register_32bit REG29 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r29_out));
   register_32bit REG30 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r30_out));
   register_32bit REG31 (.cclk(cclk), .rstb(rstb), .write(write), .data_in(write_data), .data_out(r31_out));


endmodule
`default_nettype wire
