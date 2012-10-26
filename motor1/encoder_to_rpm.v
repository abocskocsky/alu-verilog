`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    encoder_to_rpm 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module encoder_to_rpm(cclk,rstb,a,b,rpm, gr);
	//port definitions
	input  wire cclk;
	input  wire rstb;
	input  wire a;
	input  wire b;
	input  wire [7:0] gr; // use 10 to approximate 9.7
	output wire [7:0] rpm;
	
   reg reset_rev_counter;
	reg [23:0] counter;
	reg [7:0] rev_counter, temp;
   reg [15:0] raw_rpms;
   wire [15:0] raw_rpms_wire;
   
   assign raw_rpms_wire = raw_rpms;
   assign rpm = {1'b1, temp[6:0]};
   
   // The gear-ratio multiplier.
   multiplier_8bit RATIO (.X(rev_counter), .Y(gr), .Z(raw_rpms_wire));

   always @(posedge(cclk)) begin
      if (~rstb) begin
         counter <= 24'b0;
			temp <= 8'b0;
         reset_rev_counter <= 1'b1;
      end else begin
         if (counter == 10000000) begin
				temp <= raw_rpms[7:0];
            reset_rev_counter <= 1'b1;
				counter <= 0;
         end else begin
            reset_rev_counter <= 1'b0;
				counter <= counter + 1;
         end
      end
   end
	
   // Every time the motor passes A, increment the rev counter.
   // If B is already high, then the motor is going counter-clockwise
   // (negative velocity); otherwise it is going clockwise (positive
   // velocity).
	always @(posedge(a)) begin
      if (reset_rev_counter == 1'b1) begin
         rev_counter <= 8'b0;
      end else if (b == 1'b1) begin
         $display("subtracting 1");
         rev_counter <= rev_counter - 1;
      end else begin
         $display("adding 1");
         rev_counter <= rev_counter + 1;
      end
	end

endmodule
`default_nettype wire
