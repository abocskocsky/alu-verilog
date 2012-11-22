`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    alu_control 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu_control(alu_op, opcode, F, op);
	//port definitions
	input  wire [2:0] alu_op; // bit 0: L | S, bit 1: B, bit 2: R
   input  wire [5:0] opcode;
	input  wire [5:0] F;
	
	output reg [3:0] op;
	
	always @(*) begin
   	// I-type instructions use the opcode only
      if (alu_op == 3'b000) begin
         if (opcode == 6'b001000) op <= 4'b0101;  // addi
         else if (opcode == 6'b001100) op <= 4'b0000;  // andi
         else if (opcode == 6'b001101) op <= 4'b0001;  // ori
         else if (opcode == 6'b001010) op <= 4'b0111;  // slti
         else if (opcode == 6'b001110) op <= 4'b0010;  // xori
      end // Load and store instructions
      else if (alu_op == 3'b100) op <= 4'b0101;
		else if (alu_op == 3'b010) op <= 4'b0110;
		else if (alu_op === 3'b001) begin
         if (F == 6'b100100) op <= 4'b0000; // and
         else if (F == 6'b100101) op <= 4'b0001; // or
         else if (F == 6'b100110) op <= 4'b0010; // xor
         else if (F == 6'b100111) op <= 4'b0011; // nor
         else if (F == 6'b100000) op <= 4'b0101; // add
         else if (F == 6'b100010) op <= 4'b0110; // sub
         else if (F == 6'b101010) op <= 4'b0111; // slt
         else if (F == 6'b000010) op <= 4'b1000; // srl
         else if (F == 6'b000000) op <= 4'b1001; // sll
         else if (F == 6'b000011) op <= 4'b1010; // sra
		end
	end

endmodule
`default_nettype wire
