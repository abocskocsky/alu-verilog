`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:31:38 10/12/2012
// Design Name:   triangle
// Module Name:   /home/bhood/.Xilinx/workspace/motor1/test_triangle.v
// Project Name:  motor1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: triangle
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_triangle;

	// Inputs
	reg cclk;
	reg rstb;

	// Outputs
	wire [7:0] triangle;

	// Instantiate the Unit Under Test (UUT)
	triangle uut (
		.cclk(cclk), 
		.rstb(rstb), 
		.triangle(triangle)
	);

   always #5 cclk = ~cclk;
	initial begin
		// Initialize Inputs
		cclk = 0;
		rstb = 0;
      @(posedge(cclk));
      rstb = 1;
		
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      $finish;

	end
      
endmodule

