`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    add_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module add_32bit(X,Y,C_IN,Z,C_OUT);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	input  wire C_IN;
	output wire [31:0] Z;
	output wire C_OUT;

   wire [30:0] carry;
	
	add_1bit ADD0 (.X(X[0]), .Y(Y[0]), .C_IN(C_IN), .Z(Z[0]), .C_OUT(carry[0]));
	add_1bit ADD1 (.X(X[1]), .Y(Y[1]), .C_IN(carry[0]), .Z(Z[1]), .C_OUT(carry[1]));
	add_1bit ADD2 (.X(X[2]), .Y(Y[2]), .C_IN(carry[1]), .Z(Z[2]), .C_OUT(carry[2]));
	add_1bit ADD3 (.X(X[3]), .Y(Y[3]), .C_IN(carry[2]), .Z(Z[3]), .C_OUT(carry[3]));
	add_1bit ADD4 (.X(X[4]), .Y(Y[4]), .C_IN(carry[3]), .Z(Z[4]), .C_OUT(carry[4]));
	add_1bit ADD5 (.X(X[5]), .Y(Y[5]), .C_IN(carry[4]), .Z(Z[5]), .C_OUT(carry[5]));
	add_1bit ADD6 (.X(X[6]), .Y(Y[6]), .C_IN(carry[5]), .Z(Z[6]), .C_OUT(carry[6]));
	add_1bit ADD7 (.X(X[7]), .Y(Y[7]), .C_IN(carry[6]), .Z(Z[7]), .C_OUT(carry[7]));
	add_1bit ADD8 (.X(X[8]), .Y(Y[8]), .C_IN(carry[7]), .Z(Z[8]), .C_OUT(carry[8]));
	add_1bit ADD9 (.X(X[9]), .Y(Y[9]), .C_IN(carry[8]), .Z(Z[9]), .C_OUT(carry[9]));
	add_1bit ADD10 (.X(X[10]), .Y(Y[10]), .C_IN(carry[9]), .Z(Z[10]), .C_OUT(carry[10]));
	add_1bit ADD11 (.X(X[11]), .Y(Y[11]), .C_IN(carry[10]), .Z(Z[11]), .C_OUT(carry[11]));
	add_1bit ADD12 (.X(X[12]), .Y(Y[12]), .C_IN(carry[11]), .Z(Z[12]), .C_OUT(carry[12]));
	add_1bit ADD13 (.X(X[13]), .Y(Y[13]), .C_IN(carry[12]), .Z(Z[13]), .C_OUT(carry[13]));
	add_1bit ADD14 (.X(X[14]), .Y(Y[14]), .C_IN(carry[13]), .Z(Z[14]), .C_OUT(carry[14]));
	add_1bit ADD15 (.X(X[15]), .Y(Y[15]), .C_IN(carry[14]), .Z(Z[15]), .C_OUT(carry[15]));
	add_1bit ADD16 (.X(X[16]), .Y(Y[16]), .C_IN(carry[15]), .Z(Z[16]), .C_OUT(carry[16]));
	add_1bit ADD17 (.X(X[17]), .Y(Y[17]), .C_IN(carry[16]), .Z(Z[17]), .C_OUT(carry[17]));
	add_1bit ADD18 (.X(X[18]), .Y(Y[18]), .C_IN(carry[17]), .Z(Z[18]), .C_OUT(carry[18]));
	add_1bit ADD19 (.X(X[19]), .Y(Y[19]), .C_IN(carry[18]), .Z(Z[19]), .C_OUT(carry[19]));
	add_1bit ADD20 (.X(X[20]), .Y(Y[20]), .C_IN(carry[19]), .Z(Z[20]), .C_OUT(carry[20]));
	add_1bit ADD21 (.X(X[21]), .Y(Y[21]), .C_IN(carry[20]), .Z(Z[21]), .C_OUT(carry[21]));
	add_1bit ADD22 (.X(X[22]), .Y(Y[22]), .C_IN(carry[21]), .Z(Z[22]), .C_OUT(carry[22]));
	add_1bit ADD23 (.X(X[23]), .Y(Y[23]), .C_IN(carry[22]), .Z(Z[23]), .C_OUT(carry[23]));
	add_1bit ADD24 (.X(X[24]), .Y(Y[24]), .C_IN(carry[23]), .Z(Z[24]), .C_OUT(carry[24]));
	add_1bit ADD25 (.X(X[25]), .Y(Y[25]), .C_IN(carry[24]), .Z(Z[25]), .C_OUT(carry[25]));
	add_1bit ADD26 (.X(X[26]), .Y(Y[26]), .C_IN(carry[25]), .Z(Z[26]), .C_OUT(carry[26]));
	add_1bit ADD27 (.X(X[27]), .Y(Y[27]), .C_IN(carry[26]), .Z(Z[27]), .C_OUT(carry[27]));
	add_1bit ADD28 (.X(X[28]), .Y(Y[28]), .C_IN(carry[27]), .Z(Z[28]), .C_OUT(carry[28]));
	add_1bit ADD29 (.X(X[29]), .Y(Y[29]), .C_IN(carry[28]), .Z(Z[29]), .C_OUT(carry[29]));
	add_1bit ADD30 (.X(X[30]), .Y(Y[30]), .C_IN(carry[29]), .Z(Z[30]), .C_OUT(carry[30]));
	add_1bit ADD31 (.X(X[31]), .Y(Y[31]), .C_IN(carry[30]), .Z(Z[31]), .C_OUT(C_OUT));

endmodule
`default_nettype wire
