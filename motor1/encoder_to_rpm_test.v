`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:43:24 10/26/2012
// Design Name:   encoder_to_rpm
// Module Name:   /home/bhood/.Xilinx/workspace/motor1/encoder_to_rpm_test.v
// Project Name:  motor1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: encoder_to_rpm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module encoder_to_rpm_test;

	// Inputs
	reg cclk;
	reg rstb;
	reg a;
	reg b;
	reg [7:0] gr;

	// Outputs
	wire [7:0] rpm;

	// Instantiate the Unit Under Test (UUT)
	encoder_to_rpm uut (
		.cclk(cclk), 
		.rstb(rstb), 
		.a(a), 
		.b(b), 
		.rpm(rpm), 
		.gr(gr)
	);
   
   always #5 cclk <= ~cclk;
   always #6 a = ~a;
   always #7 b = ~b;

	initial begin
		// Initialize Inputs
		cclk = 0;
		rstb = 0;
		a = 0;
		b = 0;
		gr = 0;

		@(posedge cclk);
      rstb = 1;
      gr = 1;
      
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;
      #1000000000;

	end
      
endmodule

