`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    alu_control 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(alu_op, F ,op);
	//port definitions
	input  wire [2:0] alu_op; // bit 0 - R | I, bit 1 - B, bit 2 L | S
	input  wire [5:0] F;
	
	//reg [3:0] op_reg;
	
	output reg [3:0] op;
	
	always @(*) begin
		if (alu_op === 3'b100) begin 
			op <= 4'b0101;
		end else if (alu_op === 3'b010) begin
			op <= 4'b0110;
		end else if (alu_op === 3'b001) begin
			if(F === 6'b001100 || F === 6'b100000) begin
				op <= 4'b0000;
			end else if ( F === 6'b100101 || F === 6'b001101 || F === 6'b001110) begin
				op <= 4'b0001;
			end else if ( F === 6'b100110 ) begin 
				op <= 4'b0010;
			end else if ( F === 6'b100111 ) begin 
				op <= 4'b0011;
			end else if ( F === 6'b100000 || F === 6'b001000 ) begin
				op <= 4'b0101; 			
			end else if ( F === 6'b100010 ) begin 
				op <= 4'b0110;
			end else if ( F === 6'b101010 || F === 6'b001010 ) begin 
				op <= 4'b0111;
			end else if ( F === 6'b000000 ) begin 
				op <= 4'b1001;
			end else if ( F === 6'b000011 ) begin 
				op <= 4'b1010;		
			end else if ( F === 6'b000010 ) begin 
				op <= 4'b1000;		
			end
		end
	end
	
	
	//assign op_reg[3:0][0] = alu_op_reg[3:0]1 & (F[3] | F[0]);
	//assign op_reg[3:0][1] = ~alu_op_reg[3:0]1 | ~F[2];
	//assign op_reg[3:0][2] = alu_op_reg[3:0]0 | (F[1] & alu_op_reg[3:0]1);

endmodule
`default_nettype wire
