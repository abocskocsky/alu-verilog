`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    main 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////


module main(
	cclk, rstb, button_up, button_down, button_right, button_left, button_center, switch, led,
	hb0_dir, hb0_ena, enc0_a, enc0_b,
	hb1_dir, hb1_ena, enc1_a, enc1_b
);
	//port definitions
	input wire cclk, rstb, button_up, button_down, button_right, button_left, button_center;
	input wire [7:0] switch;
	output wire [7:0] led;
	
	output wire hb0_dir, hb0_ena, hb1_dir, hb1_ena;
	input wire enc0_a, enc0_b, enc1_a, enc1_b;
	
	wire [7:0] triangle_wave, rpms;
	triangle TRIANGLE(.cclk(cclk), .rstb(rstb), .triangle(triangle_wave));
   
   encoder_to_rpm ENC0 (.cclk(cclk), .rstb(rstb), .a(enc0_a), .b(enc0_b), .gr(8'ha), .rpm(rpms));
	
	motor_driver MOTOR_DRIVER0 (.cclk(cclk), .rstb(rstb), .velocity(triangle_wave), .ena(hb0_ena), .dir(hb0_dir));
	motor_driver MOTOR_DRIVER1 (.cclk(cclk), .rstb(rstb), .velocity(0            ), .ena(hb1_ena), .dir(hb1_dir)); //put in triangle_wave here when you start working with two motors
		
	//debugging
	assign led = rpms;

endmodule
`default_nettype wire
