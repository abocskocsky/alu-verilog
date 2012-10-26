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
	input  wire [7:0] gr; // 9.7 == 8 && 75 == 64;
	output wire [7:0] rpm;
	
	reg [23:0] counter;
	reg [7:0] rev_counter1;
	reg [7:0] rev_counter2;

   always @(posedge(cclk)) begin
      if (~rstb) begin
         counter <= 24'b0;
			a <= 8'b0;
			b <= 8'b0;
      end else begin
         if (counter == 10000000) begin
				rpm <= a; // TODO Figure out how b factors into the RPM function.
				rpm <= a*gr; // TODO Write a multiplier and Divider 
				a <= 8'b0;
				b <= 8'b0;
				counter <= 0;
         end else begin
				counter <= counter + 1;
         end
      end
   end
	
	always @(posedge(a)) begin 
		rev_counter1 <= rev_counter1 + 1;
	end
	
	always @(posedge(b)) begin 
		rev_counter2 <= rev_counter2 + 1;
	end
	
	







endmodule
`default_nettype wire
