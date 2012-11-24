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
`define INST_MEM_I   4'b1011
`define INST_DELAY   4'b1100
`define INST_MEM_JAL 4'b1101
`define INST_ILLEGAL 4'b1111

module control_unit(cclk, rstb, I, State, PcWriteCond, PcWrite, IorD, MemRead, MemWrite,
   MemToReg, IrWrite, PcSource, AluOp, AluSrcA, AluSrcB, RegWrite, RegDst, NextState);
	
   //port definitions
   input  wire cclk, rstb;
	input  wire [31:0] I;
   input  wire [3:0] State;
   output wire PcWrite, IorD, MemRead, MemWrite, IrWrite, AluSrcA, RegWrite;
	output wire [1:0] RegDst, MemToReg;
   output wire [1:0] PcSource, PcWriteCond, AluSrcB;
   output wire [2:0] AluOp;
   output reg  [3:0] NextState;

	wire R;  // r-type
	wire L;  // load type
	wire S;  // store type
	wire B;  // branch type
   wire J;  // jump type
	wire JAL; // jal type
	
	assign R = ~I[31] & ~I[30] & ~I[29] & ~I[28] & ~I[27] & ~I[26]; 
	assign L = I[31] & ~I[30] & ~I[29] & ~I[28] & I[27] & I[26];
	assign S = I[31] & ~I[30] & I[29] & ~I[28] & I[27] & I[26];
	assign B = ~I[31] & ~I[30] & ~I[29] & I[28] & ~I[27];
   assign J = (~I[31] & ~I[30] & ~I[29] & ~I[28] & I[27]);
	assign JAL =(R & (I[20:0] & 20'b1000));
   
   assign PcWrite = (State == `INST_FETCH | State == `INST_EXEC_J |  State == `INST_MEM_JAL ) ? 1'b1 : 1'b0;
   // MSB: bne, LSB: beq
   assign PcWriteCond = (State == `INST_EXEC_B) ? {B & I[26], B & ~I[26]} : 2'b0;
   assign IorD = (State == `INST_MEM_L | State == `INST_MEM_S) ? 1'b1 : 1'b0;
   assign MemRead = (State == `INST_FETCH | State == `INST_MEM_L) ? 1'b1 : 1'b0;
   assign MemWrite = (State == `INST_MEM_S) ? 1'b1 : 1'b0;
   assign MemToReg[0] = (State == `INST_WRITE) ? 1'b1 : 1'b0;
	assign MemToReg[1] = (State == `INST_MEM_JAL) ? 1'b1 : 1'b0;
   assign IrWrite = (State == `INST_FETCH) ? 1'b1 : 1'b0;
   assign RegWrite = (State == `INST_WRITE | State == `INST_MEM_R | State == `INST_MEM_I | State == `INST_MEM_JAL) ? 1'b1 : 1'b0;
   assign RegDst[0] = (State == `INST_MEM_R) ? 1'b1 : 1'b0;
	assign RegDst[1] = (State == `INST_MEM_JAL) ? 1'b1 : 1'b0;
   assign AluSrcA = (State == `INST_EXEC_M | State == `INST_EXEC_R |
                     State == `INST_EXEC_B | State == `INST_EXEC_I) ? 1'b1 : 1'b0;
   assign AluSrcB = (State == `INST_FETCH) ? 2'b01
         : ((State == `INST_DECODE) ? 2'b11
            : ((State == `INST_EXEC_M | State == `INST_EXEC_I) ? 2'b10 : 2'b00));
   assign PcSource = (State == `INST_EXEC_B) ? 2'b01
         : ((State == `INST_EXEC_J | State == `INST_MEM_JAL) ? 2'b10 : 2'b00);
   // 0: I-type, 1: mem, 2: branch, 3: R-type, 4: add
	assign AluOp = (State == `INST_FETCH | State == `INST_DECODE) ? 3'b100
      : (R ? 3'b011
         : (B ? 3'b010
            : ((L | S) ? 3'b001 : 3'b000)));
   
   always @(posedge cclk) begin
      if (~rstb) begin
         NextState <= `INST_FETCH;
      end else begin
         case (State)
         `INST_FETCH: NextState <= `INST_DECODE;
         `INST_DECODE: begin
            if (R) NextState <= `INST_EXEC_R;
            else if (J) NextState <= `INST_EXEC_J;
				else if (JAL) NextState <= `INST_MEM_JAL;
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
            if (S) NextState <= `INST_DELAY;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_R: begin
            if (R) NextState <= `INST_MEM_R;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_MEM_R: begin
            if (R) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_B: begin
            if (B) NextState <= `INST_DELAY;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_J: begin
            if (J | JAL) NextState <= `INST_DELAY;
            else NextState <= `INST_ILLEGAL;
         end
			`INST_MEM_JAL: begin
            if (JAL) NextState <= `INST_EXEC_J;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_EXEC_I: begin
            if (~R && ~J) NextState <= `INST_MEM_I;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_MEM_I: begin
            if (~R && ~J) NextState <= `INST_FETCH;
            else NextState <= `INST_ILLEGAL;
         end
         `INST_DELAY: NextState <= `INST_FETCH;
         default: NextState <= `INST_ILLEGAL;
         endcase
      end
   end

endmodule
`default_nettype wire
