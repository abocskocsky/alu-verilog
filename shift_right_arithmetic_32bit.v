`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    shift_right_arithmetic_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_right_arithmetic_32bit(X,Y,Z);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire [31:0] Z;


   // Don't allow negative shifts -- replace them with 0xff, which returns 0.
   wire [31:0] absY;
   assign absY = Y[31] ? 32'hff : Y;

   shift_right_1bit BIT0 (.X(X), .Y(absY), .I(0), .V(X[31]), .Z(Z[0]));
   shift_right_1bit BIT1 (.X(X), .Y(absY), .I(1), .V(X[31]), .Z(Z[1]));
   shift_right_1bit BIT2 (.X(X), .Y(absY), .I(2), .V(X[31]), .Z(Z[2]));
   shift_right_1bit BIT3 (.X(X), .Y(absY), .I(3), .V(X[31]), .Z(Z[3]));
   shift_right_1bit BIT4 (.X(X), .Y(absY), .I(4), .V(X[31]), .Z(Z[4]));
   shift_right_1bit BIT5 (.X(X), .Y(absY), .I(5), .V(X[31]), .Z(Z[5]));
   shift_right_1bit BIT6 (.X(X), .Y(absY), .I(6), .V(X[31]), .Z(Z[6]));
   shift_right_1bit BIT7 (.X(X), .Y(absY), .I(7), .V(X[31]), .Z(Z[7]));
   shift_right_1bit BIT8 (.X(X), .Y(absY), .I(8), .V(X[31]), .Z(Z[8]));
   shift_right_1bit BIT9 (.X(X), .Y(absY), .I(9), .V(X[31]), .Z(Z[9]));
   shift_right_1bit BIT10 (.X(X), .Y(absY), .I(10), .V(X[31]), .Z(Z[10]));
   shift_right_1bit BIT11 (.X(X), .Y(absY), .I(11), .V(X[31]), .Z(Z[11]));
   shift_right_1bit BIT12 (.X(X), .Y(absY), .I(12), .V(X[31]), .Z(Z[12]));
   shift_right_1bit BIT13 (.X(X), .Y(absY), .I(13), .V(X[31]), .Z(Z[13]));
   shift_right_1bit BIT14 (.X(X), .Y(absY), .I(14), .V(X[31]), .Z(Z[14]));
   shift_right_1bit BIT15 (.X(X), .Y(absY), .I(15), .V(X[31]), .Z(Z[15]));
   shift_right_1bit BIT16 (.X(X), .Y(absY), .I(16), .V(X[31]), .Z(Z[16]));
   shift_right_1bit BIT17 (.X(X), .Y(absY), .I(17), .V(X[31]), .Z(Z[17]));
   shift_right_1bit BIT18 (.X(X), .Y(absY), .I(18), .V(X[31]), .Z(Z[18]));
   shift_right_1bit BIT19 (.X(X), .Y(absY), .I(19), .V(X[31]), .Z(Z[19]));
   shift_right_1bit BIT20 (.X(X), .Y(absY), .I(20), .V(X[31]), .Z(Z[20]));
   shift_right_1bit BIT21 (.X(X), .Y(absY), .I(21), .V(X[31]), .Z(Z[21]));
   shift_right_1bit BIT22 (.X(X), .Y(absY), .I(22), .V(X[31]), .Z(Z[22]));
   shift_right_1bit BIT23 (.X(X), .Y(absY), .I(23), .V(X[31]), .Z(Z[23]));
   shift_right_1bit BIT24 (.X(X), .Y(absY), .I(24), .V(X[31]), .Z(Z[24]));
   shift_right_1bit BIT25 (.X(X), .Y(absY), .I(25), .V(X[31]), .Z(Z[25]));
   shift_right_1bit BIT26 (.X(X), .Y(absY), .I(26), .V(X[31]), .Z(Z[26]));
   shift_right_1bit BIT27 (.X(X), .Y(absY), .I(27), .V(X[31]), .Z(Z[27]));
   shift_right_1bit BIT28 (.X(X), .Y(absY), .I(28), .V(X[31]), .Z(Z[28]));
   shift_right_1bit BIT29 (.X(X), .Y(absY), .I(29), .V(X[31]), .Z(Z[29]));
   shift_right_1bit BIT30 (.X(X), .Y(absY), .I(30), .V(X[31]), .Z(Z[30]));
   shift_right_1bit BIT31 (.X(X), .Y(absY), .I(31), .V(X[31]), .Z(Z[31]));

endmodule
`default_nettype wire
