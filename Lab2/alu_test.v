`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:38:19 09/28/2012
// Design Name:   alu
// Module Name:   /home/bhood/.Xilinx/workspace/Lab2/alu_test.v
// Project Name:  Lab2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

`define NUM_TEST_VALUES 25
`define MAX_OP_CODE 4'd10
`define OP_AND 4'b0000
`define OP_OR  4'b0001
`define OP_XOR 4'b0010
`define OP_NOR 4'b0011
`define OP_ADD 4'b0101
`define OP_SUB 4'b0110
`define OP_SLT 4'b0111
`define OP_SRL 4'b1000
`define OP_SLL 4'b1001
`define OP_SRA 4'b1010

module alu_test;

	// Inputs
	reg [31:0] X;
	reg [31:0] Y;
	reg [3:0] op_code;

	// Outputs
	wire [31:0] Z;
	wire overflow;
	wire equal;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.X(X), 
		.Y(Y), 
		.op_code(op_code), 
		.Z(Z), 
		.overflow(overflow), 
		.equal(equal), 
		.zero(zero)
	);

   reg [31:0] vecX[0:10];
   reg [31:0] vecY[0:10];
   reg [31:0] i, correct;
	initial begin
      $readmemh("Xs.txt", vecX);
      $readmemh("Ys.txt", vecY);
      
      for (i = 0; i < 11; i = i + 1) begin
         X = vecX[i];
         Y = vecY[i];
         op_code = 4'h0;
         #10;
         if (Z !== (vecX[i] & vecY[i])) begin
            $display("ERROR: op=AND\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] & vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=AND\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=AND\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h1;
         #10;
         if (Z !== (vecX[i] | vecY[i])) begin
            $display("ERROR: op=OR\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] | vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=OR\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=OR\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h2;
         #10;
         if (Z !== (vecX[i] ^ vecY[i])) begin
            $display("ERROR: op=XOR\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] ^ vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=XOR\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=XOR\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h3;
         #10;
         if (Z !== ~(vecX[i] | vecY[i])) begin
            $display("ERROR: op=NOR\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, ~(vecX[i] | vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=NOR\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=NOR\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h4;
         #10;
         if (Z !== 0) begin
            $display("ERROR: opRES\tX=%x\tY=%x\tZ=%x, should be Z=0", X, Y, Z);
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=RES\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=RES\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h5;
         #10;
         if (Z !== (vecX[i] + vecY[i])) begin
            $display("ERROR: op=ADD\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] + vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=ADD\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=ADD\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h6;
         #10;
         if (Z !== (vecX[i] - vecY[i])) begin
            $display("ERROR: op=SUB\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] - vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=SUB\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=SUB\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h7;
         #10;
         if (Z !== (vecX[i] < vecY[i])) begin
            $display("ERROR: op=SLT\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] < vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=SLT\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=SLT\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h8;
         #10;
         if (Z !== (vecX[i] >> vecY[i])) begin
            $display("ERROR: op=SRL\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] >> vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=SRL\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=SRL\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'h9;
         #10;
         if (Z !== (vecX[i] << vecY[i])) begin
            $display("ERROR: op=SLL\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] << vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=SLL\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=SLL\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
         
         op_code = 4'ha;
         #10;
         if (Z !== (vecX[i] >>> vecY[i])) begin
            $display("ERROR: op=SRA\tX=%x\tY=%x\tZ=%x, should be Z=%x", X, Y, Z, (vecX[i] >>> vecY[i]));
         end
         if (Z === 0 && zero === 0) begin
            $display("ERROR: op=SRA\tX=%x\tY=%x\tzero=%x, should be zero=%x", X, Y, zero, (Z === 0));
         end
         if (X === Y && equal === 0) begin
            $display("ERROR: op=SRA\tX=%x\tY=%x\tequal=%x, should be equal=%x", X, Y, equal, (X === Y));
         end
      end
      
      X = 0; Y = 0;
		for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test that it works right when X > Y
      X = 1; Y = 0;
		for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test that it works right when Y < X and no bits overlap
      X = 1; Y = 2;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test that negative numbers are handled correctly.
      X = 32'hffffffff; Y = 2;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test that negatives are handled correctly, even when shifting.
      X = 32'b1; Y = 32'hffffffff;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test the overflow
      X = 32'h80000000; Y = 32'hffffffff;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      X = 32'hffffffff; Y = 32'h80000000;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // One of the failed test cases from the error log
      X = 0; Y = 32'h44906a28;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // Test the overflow in the other direction
      X = 32'h44906a28; Y = 32'h44906a28;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // One of the failed test cases from the error log
      X = 32'hffffffff; Y = 32'h7fffffff;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      // One of the failed test cases from the error log
      X = 32'b1; Y = 32'h7fffffff;
      for (op_code = 4'b0; op_code <= `MAX_OP_CODE; op_code = op_code + 1) begin
			#10; $display("op=%2d\tX=%x\tY=%x\tZ=%x\tzero=%b\tequal=%b\toverflow=%b", op_code, X, Y, Z, zero, equal, overflow);
		end
      
      $display("\n");
	end
      
endmodule

