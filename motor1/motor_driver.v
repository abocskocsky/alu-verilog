`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    motor_driver 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module motor_driver(cclk,rstb,velocity,ena,dir);
	//port definitions
	input  wire cclk;
	input  wire rstb;
	input  wire [7:0] velocity;
	output reg ena;
	output reg dir;
   
   // The duty cycle as computed on each clock edge from the velocity.
   reg [7:0] dutyc;
   
   wire temp1;
   wire [7:0] temp2;
   assign temp2 = dutyc;
   
   // Use 39 for the frequency to scale the max frequency of 390KHz
   // to the desired 10KHz (per the spec).
   pulse_width_modulator pwm (.CLK(cclk), .RSTB(rstb), .FREQ(8'd39), .DUTY_CYCLE(temp2), .SIGNAL(temp1));
	
   always @(posedge(cclk)) begin
      // Handle reset first
      if (~rstb) begin
         ena <= 0;
         dir <= 0;
      end else begin
         ena <= temp1;
         // If velocity > 0, set dir to high. Also scale the velocity range
         // (0-127) to 0-254 by left-shifting by 1.
         if (~velocity[7]) begin
            dir <= 1;
            dutyc <= (velocity << 1);
         end
          // Otherwise dir = 0 and scale -1 to -128 to 0-255 by flipping the sign
          // bit (the equivalent of adding 128) and left-shifting by 1.
         else begin
            dir <= 0;
            dutyc <= (~velocity) << 1;
         end
      end
   end
   
endmodule
`default_nettype wire
