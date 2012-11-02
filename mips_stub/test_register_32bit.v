`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:42:52 11/02/2012
// Design Name:   register_32bit
// Module Name:   /home/bhood/.Xilinx/workspace/mips_stub/test_register_32bit.v
// Project Name:  mips_stub
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: register_32bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_register_32bit;

	// Inputs
	reg cclk;
	reg rstb;
	reg write;
	reg [31:0] data_in;

	// Outputs
	wire [31:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	register_32bit uut (
		.cclk(cclk), 
		.rstb(rstb), 
		.write(write), 
		.data_in(data_in), 
		.data_out(data_out)
	);
   
   always #5 cclk = ~cclk;

	initial begin
		// Initialize Inputs
		cclk = 1'b0;
		rstb = 1'b0;
		write = 1'b0;
		data_in = 1'b0;
      @(posedge cclk);

		// Make sure data is written when write and rstb
		rstb = 1'b1;
      write = 1'b1;
      data_in = 32'hffffffff;
      @(posedge cclk);  // data_out = -1
        
		// And data should not be written when either ~write or ~rstb
		rstb = 1'b1;
      write = 1'b0;
      data_in = 32'b1;
      @(posedge cclk);  // data_out = -1
      
      rstb = 1'b0;
      write = 1'b1;
      data_in = 32'b1;
      @(posedge cclk);  // data_out = 0
      
      // Then write again.
		rstb = 1'b1;
      write = 1'b1;
      data_in = 32'h1;
      @(posedge cclk);  // data_out = 1
      
      $finish;

	end
      
endmodule

