`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    control_unit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////

`define INST_FETCH   4'b0000
`define INST_DECODE  4'b0001
`define INST_EXEC_M  4'b0010
`define INST_MEM_L   4'b0011
`define INST_WRITE   4'b0100
`define INST_MEM_S   4'b0101
`define INST_EXEC_R  4'b0110
`define INST_MEM_R   4'b0111
`define INST_EXEC_B  4'b1000
`define INST_EXEC_J  4'b1001
`define INST_ILLEGAL 4'b1111

module control_unit(I, State, PcWriteCond, PcWrite, IorD, MemRead, MemWrite,
   MemToReg, IrWrite, PcSource, AluOp, AluSrcA, AluSrcB, RegWrite, RegDst, NextState);
	
   //port definitions
	input  wire [31:0] I;
   input  wire [3:0] State;
   output reg  PcWriteCond, PcWrite, IorD, MemRead, MemWrite,
               MemToReg, IrWrite, AluSrcA, RegWrite, RegDst;
   output reg  [1:0] PcSource, AluSrcB;
   output wire [2:0] AluOp;
   output reg  [3:0] NextState;

	wire R;  // r-type
	wire L;  // load type
	wire S;  // store type
	wire B;  // branch type
   wire J;  // jump type
	
	assign R = ~I[31] & ~I[30] & ~I[29] & ~I[28] & ~I[27] & ~I[26]; 
	assign L = I[31] & ~I[30] & ~I[29] & ~I[28] & I[27] & I[26];
	assign S = I[31] & ~I[30] & I[29] & ~I[28] & I[27] & I[26];
	assign B = ~I[31] & ~I[30] & ~I[29] & I[28] & ~I[27];
   assign J = (~I[31] & ~I[30] & ~I[29] & ~I[28] & I[27]) | (R & (I[20:0] & 20'b1000));
   // 1st bit: R- or I-type (excl. branch), 2nd bit: branch type, 3rd bit: load or store type
	assign ALUOp = {(L | S), B, (~B & ~J & ~L & ~S)};
   
   always @(*) begin
      case (State)
      `INST_FETCH: begin
         PcWrite <= 1'b1;
         IorD <= 1'b0;
         MemRead <= 1'b1;
         MemWrite <= 1'b0;
         IrWrite <= 1'b1;
         PcSource <= 2'b00;
         AluSrcA <= 1'b0;
         AluSrcB <= 2'b01;
         RegWrite <= 1'b0;
         NextState <= `INST_DECODE;
      end
      INST_DECODE: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         AluSrcA <= 1'b0;
         AluSrcB <= 2'b11;
         RegWrite <= 1'b0;
         if (R) NextState <= `INST_EXEC_R;
         else if (J) NextState <= `INST_EXEC_J;
         else if (B) NextState <= `INST_EXEC_B;
         else if (L | S) NextState <= `INST_EXEC_M;
         else NextState <= `INST_ILLEGAL;
      end
      INST_EXEC_M: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         AluSrcA <= 1'b1;
         AluSrcB <= 2'b10;
         RegWrite <= 1'b0;
         if (L) NextState <= `INST_MEM_L;
         else if (S) NextState <= `INST_MEM_S;
         else NextState <= `INST_ILLEGAL;
      end
      INST_MEM_L: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         IorD <= 1'b1;
         MemRead <= 1'b1;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         RegWrite <= 1'b0;
         if (L) NextState <= `INST_WRITE;
         else NextState <= `INST_ILLEGAL;
      end
      INST_WRITE: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         MemToReg <= 1'b1;
         RegWrite <= 1'b1;
         RegDst <= 1'b0;
         if (L) NextState <= `INST_DECODE;
         else NextState <= `INST_ILLEGAL;
      end
      INST_MEM_S: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         IorD <= 1'b1;
         MemWrite <= 1'b1;
         IrWrite <= 1'b0;
         RegWrite <= 1'b0;
         if (S) NextState <= `INST_DECODE;
         else NextState <= `INST_ILLEGAL;
      end
      INST_EXEC_R: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         AluSrcA <= 1'b1;
         RegWrite <= 1'b0;
         if (R) NextState <= `INST_MEM_R;
         else NextState <= `INST_ILLEGAL;
      end
      INST_MEM_R: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b0;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         MemToReg <= 1'b0;
         RegWrite <= 1'b1;
         RegDst <= 1'b1;
         if (R) NextState <= `INST_DECODE;
         else NextState <= `INST_ILLEGAL;
      end
      INST_EXEC_B: begin
         PcWrite <= 1'b0;
         PcWriteCond <= 1'b1;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         PcSource <= 2'b01;
         AluSrcA <= 1'b1;
         AluSrcB <= 2'b00;
         RegWrite <= 1'b0;
         if (B) NextState <= `INST_DECODE;
         else NextState <= `INST_ILLEGAL;
      end
      INST_EXEC_J: begin
         PcWrite <= 1'b1;
         MemWrite <= 1'b0;
         IrWrite <= 1'b0;
         PcSource <= 2'b10;
         RegWrite <= 1'b0;
         if (J) NextState <= `INST_DECODE;
         else NextState <= `INST_ILLEGAL;
      end
      default: NextState <= `INST_ILLEGAL;
      endcase
   end
	
	assign RegDst = R;
	assign ALUSrc = L | S;
	assign MemtoReg = L;
	assign RegWrite = R | L;
	assign MemRead = L;
	assign MemWrite = S;
	assign Branch = B;
   assign BranchNEq = B & I[26];
   assign Jump = J | (~(& I[31:26]) & (I[20:0] & 20'b1000));

endmodule
`default_nettype wire
