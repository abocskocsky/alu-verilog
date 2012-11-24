`timescale 1ns/1ps
`default_nettype none

module mips(clk, rstb, mem_wr_data, mem_addr, mem_rd_data, mem_wr_ena, PC);

	input wire clk, rstb;
	output wire mem_wr_ena;
	output wire [31:0] mem_wr_data, mem_addr;
	input wire [31:0] mem_rd_data;             
	output reg [31:0] PC;
   
   // Intermediate registers after the memory, the register file, and the ALU.
   reg  [31:0] MemDataReg, InstReg, RegA, RegB, AluOut;
   
   // Wires going into the register file.
   wire [4:0] RegFile_WriteAddr;
   wire [31:0] RegFile_WriteData;
        
   // Wires coming out of the register file.
   wire [31:0] RegFile_Data0, RegFile_Data1, AluAMux, AluBMux;
   
   // Wires coming out of the control unit.
   wire Ctl_PcWrite, Ctl_IorD, Ctl_MemRead, Ctl_MemWrite,
        Ctl_MemToReg, Ctl_IrWrite, Ctl_AluSrcA, Ctl_RegWrite, Ctl_RegDst;
   wire [1:0] Ctl_PcWriteCond, Ctl_PcSource, Ctl_AluSrcB;
   wire [2:0] Ctl_AluOp;
   wire [3:0] Ctl_State;

   // Wires coming out of the ALU control.
   wire [3:0] AluCtl_AluOpcode;
   
   // Wires coming out of the ALU.
   wire Alu_Zero;
   wire [31:0] Alu_Z;
   
   // Wires coming out of the sign extender.
   wire [31:0] SignExtend_Out;
   
   // Inputs that feed into the memory: address and write data.
   assign mem_addr = Ctl_IorD ? AluOut : PC;
   assign mem_wr_data = RegB;
   assign mem_wr_ena = Ctl_MemWrite;
   
   // The muxes that feed into the register file.
   assign RegFile_WriteAddr = Ctl_RegDst ? InstReg[15:11] : InstReg[20:16];
   assign RegFile_WriteData = Ctl_MemToReg ? mem_rd_data : AluOut;
   
   // The muxes that feed into the ALU.
   assign AluAMux = Ctl_AluSrcA ? RegA : PC;
   assign AluBMux = Ctl_AluSrcB[1]
      ? (Ctl_AluSrcB[0] ? {SignExtend_Out[29:0],2'b0} : SignExtend_Out)
      : (Ctl_AluSrcB[0] ? 32'd4 : RegB);

	register_file REGFILE (.cclk(clk), .rstb(rstb), .write(Ctl_RegWrite),
         .write_reg(RegFile_WriteAddr), .write_data(RegFile_WriteData),
         .read_reg_0(InstReg[25:21]), .read_reg_1(InstReg[20:16]),
         .reg0(RegFile_Data0), .reg1(RegFile_Data1));

   control_unit CONTROL (.cclk(clk), .rstb(rstb), .I(InstReg), .State(Ctl_State),
      .PcWriteCond(Ctl_PcWriteCond), .PcWrite(Ctl_PcWrite), .IorD(Ctl_IorD),
      .MemRead(Ctl_MemRead), .MemWrite(Ctl_MemWrite), .MemToReg(Ctl_MemToReg),
      .IrWrite(Ctl_IrWrite), .PcSource(Ctl_PcSource), .AluOp(Ctl_AluOp),
      .AluSrcA(Ctl_AluSrcA), .AluSrcB(Ctl_AluSrcB), .RegWrite(Ctl_RegWrite),
      .RegDst(Ctl_RegDst), .NextState(Ctl_State));

   alu_control ALU_CONTROL (.alu_op(Ctl_AluOp),
      .opcode(InstReg[31:26]), .F(InstReg[5:0]), .op(AluCtl_AluOpcode));

   alu ALU (.X(AluAMux), .Y(AluBMux), .op_code(AluCtl_AluOpcode), .Z(Alu_Z), .zero(Alu_Zero));

   bit_extender SIGN_EXTEND (.X(InstReg[15:0]), .Z(SignExtend_Out));
   
   // When the clock hits a positive edge, update the registers.
   always @(posedge clk) begin
      if (~rstb) begin
         MemDataReg <= 32'b0;
         InstReg <= 32'b0;
         RegA <= 32'b0;
         RegB <= 32'b0;
         AluOut <= 32'b0;
         PC <= 32'b0;
      end else begin
         RegA <= RegFile_Data0;
         RegB <= RegFile_Data1;
         if (Ctl_MemToReg) MemDataReg <= mem_rd_data;
         if (Ctl_IrWrite) InstReg <= mem_rd_data;
         AluOut <= Alu_Z;
         if (Ctl_PcWrite || (Ctl_PcWriteCond[0] & Alu_Zero) ||
              (Ctl_PcWriteCond[1] & ~Alu_Zero)) begin
            case (Ctl_PcSource)
            2'b00: PC <= Alu_Z;
            2'b01: PC <= AluOut;
            2'b10: PC <= {PC[31:28], InstReg[25:0], 2'b0};
            endcase
         end
      end
   end

endmodule

`default_nettype wire