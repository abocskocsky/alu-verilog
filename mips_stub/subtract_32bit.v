`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    subtract_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module subtract_32bit(
   X,
   Y,
   C_IN,
   Z,
   C_OUT
);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	input  wire C_IN;
	output wire [31:0] Z;
	output wire C_OUT;
   
   // Chain 32 1-bit subtractors together. We only need 31 bits in the
   // intermediate bus because the last carry-out goes to C_OUT.
   wire [30:0] carry;
   subtract_1bit sub1_0 (.X(X[0]), .Y(Y[0]), .C_IN(C_IN), .Z(Z[0]), .C_OUT(carry[0]));
   subtract_1bit sub1_1 (.X(X[1]), .Y(Y[1]), .C_IN(carry[0]), .Z(Z[1]), .C_OUT(carry[1]));
   subtract_1bit sub1_2 (.X(X[2]), .Y(Y[2]), .C_IN(carry[1]), .Z(Z[2]), .C_OUT(carry[2]));
   subtract_1bit sub1_3 (.X(X[3]), .Y(Y[3]), .C_IN(carry[2]), .Z(Z[3]), .C_OUT(carry[3]));
   subtract_1bit sub1_4 (.X(X[4]), .Y(Y[4]), .C_IN(carry[3]), .Z(Z[4]), .C_OUT(carry[4]));
   subtract_1bit sub1_5 (.X(X[5]), .Y(Y[5]), .C_IN(carry[4]), .Z(Z[5]), .C_OUT(carry[5]));
   subtract_1bit sub1_6 (.X(X[6]), .Y(Y[6]), .C_IN(carry[5]), .Z(Z[6]), .C_OUT(carry[6]));
   subtract_1bit sub1_7 (.X(X[7]), .Y(Y[7]), .C_IN(carry[6]), .Z(Z[7]), .C_OUT(carry[7]));
   subtract_1bit sub1_8 (.X(X[8]), .Y(Y[8]), .C_IN(carry[7]), .Z(Z[8]), .C_OUT(carry[8]));
   subtract_1bit sub1_9 (.X(X[9]), .Y(Y[9]), .C_IN(carry[8]), .Z(Z[9]), .C_OUT(carry[9]));
   subtract_1bit sub1_10 (.X(X[10]), .Y(Y[10]), .C_IN(carry[9]), .Z(Z[10]), .C_OUT(carry[10]));
   subtract_1bit sub1_11 (.X(X[11]), .Y(Y[11]), .C_IN(carry[10]), .Z(Z[11]), .C_OUT(carry[11]));
   subtract_1bit sub1_12 (.X(X[12]), .Y(Y[12]), .C_IN(carry[11]), .Z(Z[12]), .C_OUT(carry[12]));
   subtract_1bit sub1_13 (.X(X[13]), .Y(Y[13]), .C_IN(carry[12]), .Z(Z[13]), .C_OUT(carry[13]));
   subtract_1bit sub1_14 (.X(X[14]), .Y(Y[14]), .C_IN(carry[13]), .Z(Z[14]), .C_OUT(carry[14]));
   subtract_1bit sub1_15 (.X(X[15]), .Y(Y[15]), .C_IN(carry[14]), .Z(Z[15]), .C_OUT(carry[15]));
   subtract_1bit sub1_16 (.X(X[16]), .Y(Y[16]), .C_IN(carry[15]), .Z(Z[16]), .C_OUT(carry[16]));
   subtract_1bit sub1_17 (.X(X[17]), .Y(Y[17]), .C_IN(carry[16]), .Z(Z[17]), .C_OUT(carry[17]));
   subtract_1bit sub1_18 (.X(X[18]), .Y(Y[18]), .C_IN(carry[17]), .Z(Z[18]), .C_OUT(carry[18]));
   subtract_1bit sub1_19 (.X(X[19]), .Y(Y[19]), .C_IN(carry[18]), .Z(Z[19]), .C_OUT(carry[19]));
   subtract_1bit sub1_20 (.X(X[20]), .Y(Y[20]), .C_IN(carry[19]), .Z(Z[20]), .C_OUT(carry[20]));
   subtract_1bit sub1_21 (.X(X[21]), .Y(Y[21]), .C_IN(carry[20]), .Z(Z[21]), .C_OUT(carry[21]));
   subtract_1bit sub1_22 (.X(X[22]), .Y(Y[22]), .C_IN(carry[21]), .Z(Z[22]), .C_OUT(carry[22]));
   subtract_1bit sub1_23 (.X(X[23]), .Y(Y[23]), .C_IN(carry[22]), .Z(Z[23]), .C_OUT(carry[23]));
   subtract_1bit sub1_24 (.X(X[24]), .Y(Y[24]), .C_IN(carry[23]), .Z(Z[24]), .C_OUT(carry[24]));
   subtract_1bit sub1_25 (.X(X[25]), .Y(Y[25]), .C_IN(carry[24]), .Z(Z[25]), .C_OUT(carry[25]));
   subtract_1bit sub1_26 (.X(X[26]), .Y(Y[26]), .C_IN(carry[25]), .Z(Z[26]), .C_OUT(carry[26]));
   subtract_1bit sub1_27 (.X(X[27]), .Y(Y[27]), .C_IN(carry[26]), .Z(Z[27]), .C_OUT(carry[27]));
   subtract_1bit sub1_28 (.X(X[28]), .Y(Y[28]), .C_IN(carry[27]), .Z(Z[28]), .C_OUT(carry[28]));
   subtract_1bit sub1_29 (.X(X[29]), .Y(Y[29]), .C_IN(carry[28]), .Z(Z[29]), .C_OUT(carry[29]));
   subtract_1bit sub1_30 (.X(X[30]), .Y(Y[30]), .C_IN(carry[29]), .Z(Z[30]), .C_OUT(carry[30]));
   subtract_1bit sub1_31 (.X(X[31]), .Y(Y[31]), .C_IN(carry[30]), .Z(Z[31]), .C_OUT(C_OUT));

endmodule
`default_nettype wire
