`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:22 10/19/2012
// Design Name:   motor_driver
// Module Name:   /home/bhood/.Xilinx/workspace/motor1/test_motor_driver.v
// Project Name:  motor1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: motor_driver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_motor_driver;

	// Inputs
	reg cclk;
	reg rstb;
	reg [7:0] velocity;

	// Outputs
	wire ena;
	wire dir;

	// Instantiate the Unit Under Test (UUT)
	motor_driver uut (
		.cclk(cclk), 
		.rstb(rstb), 
		.velocity(velocity), 
		.ena(ena), 
		.dir(dir)
	);

   always #5 cclk <= ~cclk;
	initial begin
		// Initialize Inputs
		cclk = 0;
		rstb = 0;
      @(posedge cclk);
      rstb = 1;
      
      // Try velocity = 0
		velocity = 8'h00;
      #1000000;
      
      // A positive velocity
      velocity = 8'h42;
      #1000000;
      
      // Max positive velocity
      velocity = 8'h7f;
      #1000000;
      
      // A negative velocity
      velocity = 8'hc6;
      #1000000;
      
      // Max negative velocity
      velocity = 8'h80;
      #1000000;
      
      $finish;

	end
      
endmodule

