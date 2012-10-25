`timescale 1ns / 1ps
`default_nettype none

///////////////////////////////////////////////////////////////////////////////
// 
// Module Name:  pulse_width_modulator
// Authors:      Andrew Bocskocsky and Byron Hood
// Description:  A pulse-width modulator unit that allows both the frequency
//               and duty cycle of the generated signal to be configured
//               independently.
//
///////////////////////////////////////////////////////////////////////////////

module pulse_width_modulator(CLK,RSTB,FREQ,DUTY_CYCLE,SIGNAL);
	input  wire CLK;              // The clock signal
	input  wire RSTB;             // Active-low reset signal
	input  wire [7:0] FREQ;       // Number of cycles per wave, multiple of 256
	input  wire [7:0] DUTY_CYCLE; // Length of duty cycle: 0=0%, 255=100%
   output reg SIGNAL;            // The signal as configured above
   
   // An internal counter running from 0 to the end of the 256-wave
   reg [7:0] counter;
   // An internal counter that goes from 0 to FREQ, allowing counter
   // to increment at different intervals.
   reg [7:0] freq_counter;
   
   always @(posedge(CLK)) begin
      if (~RSTB) begin
         SIGNAL <= 1'b0;
         counter <= 8'b0;
         freq_counter <= 8'b0;
      end else begin
         // Always set the signal to 1 when counter reaches 0
         if (counter == 8'b0) begin
            SIGNAL <= 1'b1;
         end
         // Once the counter reaches the shutoff point, set the
         // output signal to 0 immediately. Don't set the counter
         // to zero though -- the "off" portion of the cycle must
         // still be gone through. The counter will eventually
         // overflow to zero, starting the "up" of the next wave.
         if (counter == DUTY_CYCLE) begin
            SIGNAL <= 8'b0;
         end
         if (freq_counter == FREQ) begin
            freq_counter <= 8'b0;
            counter <= counter + 8'b1;
         end else begin
            freq_counter <= freq_counter + 8'b1;
         end
      end
   end

endmodule
`default_nettype wire
