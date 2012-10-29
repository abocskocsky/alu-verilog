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
	
   reg last_a;
	reg [7:0] rev_counter, a_counter, rpms_wire;
   reg [15:0] raw_rpms;
	reg [31:0] counter;
   wire [15:0] raw_rpms_wire;
   
   assign rpm = rpms_wire;
   
   // The gear-ratio multiplier.
   multiplier_8bit RATIO (.cclk(cclk), .X(rev_counter), .Y(gr), .Z(raw_rpms_wire));

   always @(posedge cclk) begin
      raw_rpms <= raw_rpms_wire;
      if (~rstb) begin
         a_counter <= 8'b0;
         counter <= 32'b0;
         rev_counter <= 8'b0;
			rpms_wire <= 8'b0;
         last_a <= 1'b0;
      end else begin
         if (counter == 32'd10000000) begin
				rpms_wire <= raw_rpms[7:0];
				counter <= 32'b0;
         end else begin
            counter <= counter + 32'b1;
            // Every time the motor passes A, increment the rev counter.
            // If B is already high, then the motor is going counter-clockwise
            // (negative velocity); otherwise it is going clockwise.
            if (last_a == 1'b0 && a == 1'b1) begin
               // There are 48 up edges per full revolution
               if (a_counter == 8'd48) begin
                  a_counter <= 8'b0;
                  if (b == 1'b1) begin
                     rev_counter <= rev_counter - 8'b1;
                  end else begin
                     rev_counter <= rev_counter + 8'b1;
                  end
               end else begin
                  a_counter <= a_counter + 8'b1;
               end
            end
            last_a <= a;
         end
      end
   end

endmodule
`default_nettype wire
