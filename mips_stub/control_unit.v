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
`define INST_EXEC_I  4'b1010
`define INST_ILLEGAL 4'b1111

module control_unit(cclk, rstb, I, State, PcWriteCond, PcWrite, IorD, MemRead, MemWrite,
   MemToReg, IrWrite, PcSource, AluOp, AluSrcA, AluSrcB, RegWrite, RegDst, NextState);
	
   //port definitions
   input  wire cclk, rstb;
	input  wire [31:0] I;
   input  wire [3:0] State;
   output wire PcWriteCond, PcWrite, IorD, MemRead, MemWrite,
               MemToReg, IrWrite, AluSrcA, RegWrite, RegDst;
   output wire [1:0] PcSource, AluSrcB;
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
   
   assign PcWrite = (State == 4'b0000 | State == 4'b1001) ? 1'b1 : 1'b0;
   assign PcWriteCond = (State == 4'b1000) ? 1'b1 : 1'b0;
   assign IorD = (State == 4'b0011 | State == 4'b0101) ? 1'b1 : 1'b0;
   assign MemRead = (State == 4'b0000 | State == 4'b0011) ? 1'b1 : 1'b0;
   assign MemWrite = (State == 4'b0101) ? 1'b1 : 1'b0;
   assign MemToReg = (State == 4'b0100) ? 1'b1 : 1'b0;
   assign IrWrite = (State == 4'b0000) ? 1'b1 : 1'b0;
   assign RegWrite = (State == 4'b0100 | State == 4'b0111) ? 1'b1 : 1'b0;
   assign RegDst = (State == 4'b0111) ? 1'b1 : 1'b0;
   assign AluSrcA = (State == 4'b0010 | State == 4'b0110 |
                     State == 4'b1000 | State == 4'b1010) ? 1'b1 : 1'b0;
   assign AluSrcB = (State == 4'b0000) ? 2'b01
         : ((State == 4'b0001) ? 2'b11
            : ((State == 4'b0010 | State == 4'b1010) ? 2'b10 : 2'b00));
   assign PcSource = (State == 4'b1000) ? 2'b01
         : ((State == 4'b1001) ? 2'b10 : 2'b00);
   // 1st bit: load or store type, 2nd bit: branch type, 3rd bit: R- or I-type (excl. branch, load, store)
	assign AluOp = {(L | S), B, R & ~J};
   
   always @(posedge cclk) begin
      if (~rstb) begin
         NextState <= 4'b0000;
      end else begin
         case (State)
         `INST_FETCH: NextState <= `INST_DECODE;
         `INST_DECODE: begin
            if (R) NextState <= `INST_EXEC_R;
            else if (J) NextState <= `INST_EXEC_J;
            else if (B) NextState <= `INST_EXEC_B;
            else if (L | S) NextState <= `INST_EXEC_M;
            else NextState <= `INST_EXEC_I;
         end
         `INST_EXEC_M: begin
            if (L) NextState <= `INST_MEM_L;
            else if (S) NextState <= `INST_MEM_S;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_MEM_L: begin
            if (L) NextState <= `INST_WRITE;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_WRITE: begin
            if (L) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_MEM_S: begin
            if (S) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_R: begin
            if (R) NextState <= `INST_MEM_R;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_MEM_R: begin
            // Generic I-type feeds in here too
            if (R | (~R & ~B & ~J & ~L & ~S)) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_B: begin
            if (B) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_J: begin
            if (J) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_I: begin
            if (~R && ~J) NextState <= `INST_MEM_R;
            else NextState <= `INST_ILLEGAL;
         end
         default: NextState <= `INST_ILLEGAL;
         endcase
      end
   end

endmodule
`default_nettype wire
