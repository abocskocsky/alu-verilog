`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    alu 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module alu(X,Y,op_code,Z,overflow,equal,zero);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	input  wire [3:0] op_code;
	output wire [31:0] Z;
	output wire overflow;
	output wire equal;
	output wire zero;
   
   wire [31:0] and_output, or_output,  xor_output, nor_output, add_output,
               sub_output, slt_output, srl_output, sra_output, sll_output;
   wire add_overflow, sub_overflow;
   assign and_output = X & Y;
   assign or_output  = X | Y;
   assign xor_output = X ^ Y;
   assign nor_output = ~or_output;
   add_32bit ADDER (.X(X), .Y(Y), .C_IN(1'b0), .Z(add_output), .C_OUT(add_overflow)); // BUG!!!
   subtract_32bit SUBTRACTER (.X(X), .Y(Y), .C_IN(1'b0), .Z(sub_output), .C_OUT(sub_overflow)); // BUG!!!
   set_less_than_32bit SLT (.X(X), .Y(Y), .Z(slt_output[0]));
   assign slt_output[31:1] = 31'b0;
   shift_right_logical_32bit SRL (.X(X), .Y(Y), .Z(srl_output));
   shift_right_arithmetic_32bit SRA (.X(X), .Y(Y), .Z(sra_output));
   shift_left_32bit SLL (.X(X), .Y(Y), .Z(sll_output));
   
   // Multiplex it all together for the result Z
   mux_16to1 RESULT_MUX
             (.X1(and_output),
              .X2(or_output),
              .X3(xor_output),
              .X4(nor_output),
              .X5(32'b0),
              .X6(add_output),
              .X7(sub_output),
              .X8(slt_output),
              .X9(srl_output),
              .X10(sll_output),
              .X11(sra_output),
              .X12(32'b0),
              .X13(32'b0),
              .X14(32'b0),
              .X15(32'b0),
              .X16(32'b0),
              .C(op_code),
              .R(Z));
              
    // Multiplex to determine whether the opcode is reserved
    wire is_valid;
    mux_16to1 #(.N(1)) VALIDITY_MUX
              (.X1(1'b1),
               .X2(1'b1),
               .X3(1'b1),
               .X4(1'b1),
               .X5(1'b0),
               .X6(1'b1),
               .X7(1'b1),
               .X8(1'b1),
               .X9(1'b1),
               .X10(1'b1),
               .X11(1'b1),
               .X12(1'b0),
               .X13(1'b0),
               .X14(1'b0),
               .X15(1'b0),
               .X16(1'b0),
               .C(op_code),
               .R(is_valid));
    
    // Set the other flags
    wire sub_equal_0, z_equal_0, overflow_bit;
    wire [1:0] op_is_add_sub;
    equals #(.N(4)) IS_ADD (.X(op_code), .Y(4'b0101), .Z(op_is_add_sub[1]));
    equals #(.N(4)) IS_SUB (.X(op_code), .Y(4'b0110), .Z(op_is_add_sub[0]));
    equals #(.N(32)) SUB_IS_0 (.X(sub_output), .Y(32'b0), .Z(sub_equal_0));
    equals #(.N(32)) Z_IS_0 (.X(Z), .Y(32'b0), .Z(z_equal_0));
    
    mux_4to1 #(.N(1)) OVERFLOW (.W(1'b0), .X(sub_overflow), .Y(add_overflow),
                                .Z(1'b0), .R(overflow_bit), .C(op_is_add_sub));
    assign equal = is_valid ? sub_equal_0 : 0;
    assign zero = is_valid ? z_equal_0 : 0;
    assign overflow = is_valid ? overflow_bit : 0;

endmodule
`default_nettype wire
