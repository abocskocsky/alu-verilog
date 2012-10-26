`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    triangle 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module triangle(cclk,rstb,triangle);
	//port definitions
	input  wire cclk;
	input  wire rstb;
	output reg signed [7:0] triangle; // goes to motor velocity
   
   // Scales back the clock by a factor of 500M / 768 = 651042 so that we
   // perform 768 increments/decrements in about 5 seconds.
   reg [23:0] counter;
   
   reg updown; // 1 = going up, 0 = going down
	
	//create a triangle wave centered at zero that has a period of ~5 seconds (assuming a 100MHz input clock)
   always @(posedge(cclk)) begin
      if (~rstb) begin
         counter <= 24'b0;
         triangle <= 8'b0;
         updown <= 1'b1;
      end else begin
         if (counter == 5208336) begin
            if (updown == 1'b1) begin
               if (triangle == 8'h7f) begin
                  updown <= 0;
                  triangle <= triangle - 1;
               end else begin
                  triangle <= triangle + 1;
               end
            end else begin
               if (triangle == 8'h80) begin
                  updown <= 1;
                  triangle <= triangle + 1;
               end else begin
                  triangle <= triangle - 1;
               end
            end
            counter <= 0;
         end else begin
            counter <= counter + 1;
         end
      end
   end

endmodule
`default_nettype wire
