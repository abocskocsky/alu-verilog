`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:18:18 10/26/2012
// Design Name:   multiplier_8bit
// Module Name:   /home/bhood/.Xilinx/workspace/motor1/multiplier_8bit_test.v
// Project Name:  motor1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: multiplier_8bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module multiplier_8bit_test;

	// Inputs
	reg cclk;
	reg [7:0] X;
	reg [7:0] Y;

	// Outputs
	wire [15:0] Z;

	// Instantiate the Unit Under Test (UUT)
	multiplier_8bit uut (
		.cclk(cclk), 
		.X(X), 
		.Y(Y), 
		.Z(Z)
	);

   always #5 cclk = ~cclk;
   
	initial begin
		// Initialize Inputs
		cclk = 0;
		X = 0;
		Y = 0;

		// Test cases
      repeat (5) @(posedge cclk);
      X = 1;
      Y = 1;
      
      repeat (5) @(posedge cclk);
      X = 0;
      Y = 1;
      
      repeat (5) @(posedge cclk);      
      X = 1;
      Y = 0;
      
      repeat (5) @(posedge cclk);
      X = 2;
      Y = 2;
      
      repeat (5) @(posedge cclk);
      X = 8'hfe;
      Y = 2;
      
      repeat (5) @(posedge cclk);
      $finish;

	end
      
endmodule

