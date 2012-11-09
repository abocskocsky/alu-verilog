`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:37:15 11/08/2012
// Design Name:   register_file
// Module Name:   /home/bhood/.Xilinx/workspace/mips_stub/test_register_file.v
// Project Name:  mips_stub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_file
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_register_file;

	// Inputs
	reg cclk;
	reg rstb;
	reg write;
	reg [4:0] read_reg_0;
	reg [4:0] read_reg_1;
	reg [4:0] write_reg;
	reg [31:0] write_data;

	// Outputs
	wire [31:0] reg0;
	wire [31:0] reg1;

	// Instantiate the Unit Under Test (UUT)
	register_file uut (
		.cclk(cclk), 
		.rstb(rstb), 
		.write(write), 
		.read_reg_0(read_reg_0), 
		.read_reg_1(read_reg_1), 
		.write_reg(write_reg), 
		.write_data(write_data), 
		.reg0(reg0), 
		.reg1(reg1)
	);
   
   always #5 cclk <= ~cclk;

	initial begin
		// Initialize Inputs
		cclk = 0;
		rstb = 0;
		write = 0;
		read_reg_0 = 0;
		read_reg_1 = 0;
		write_reg = 0;
		write_data = 0;
		@(posedge cclk);
      rstb = 1;
      
      write = 1;
      write_reg = 0;
      write_data = 1;
      @(posedge cclk);
      read_reg_0 = 0;
      read_reg_1 = 0;
      write_reg = 1;
      write_data = 1;
      @(posedge cclk);
      read_reg_0 = 0;
      read_reg_1 = 1;
      write_reg = 2;
      write_data = 2;
      @(posedge cclk);
      read_reg_0 = 2;
      read_reg_1 = 0;
      write_reg = 3;
      write_data = 3;
      @(posedge cclk);
      read_reg_0 = 3;
      read_reg_1 = 1;
      write_reg = 4;
      write_data = 5;
      @(posedge cclk);
      read_reg_0 = 2;
      read_reg_1 = 4;
      write_reg = 5;
      write_data = 8;
      @(posedge cclk);
      read_reg_0 = 5;
      read_reg_1 = 1;
      write_reg = 30;
      write_data = 13;
      @(posedge cclk);
      read_reg_0 = 6;
      read_reg_1 = 2;
      write_reg = 31;
      write_data = 21;
      @(posedge cclk);

	end
      
endmodule

