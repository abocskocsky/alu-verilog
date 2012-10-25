`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// 
// Module Name:    shift_left_32bit 
// Description: 
//
//////////////////////////////////////////////////////////////////////////////////
module shift_left_32bit(X,Y,Z);
	//port definitions
	input  wire [31:0] X;
	input  wire [31:0] Y;
	output wire [31:0] Z;

   wire [31:0] tempZ;
   shift_left_1bit BIT0 (.X(X), .Y(Y), .I(0), .Z(tempZ[0]));
   shift_left_1bit BIT1 (.X(X), .Y(Y), .I(1), .Z(tempZ[1]));
   shift_left_1bit BIT2 (.X(X), .Y(Y), .I(2), .Z(tempZ[2]));
   shift_left_1bit BIT3 (.X(X), .Y(Y), .I(3), .Z(tempZ[3]));
   shift_left_1bit BIT4 (.X(X), .Y(Y), .I(4), .Z(tempZ[4]));
   shift_left_1bit BIT5 (.X(X), .Y(Y), .I(5), .Z(tempZ[5]));
   shift_left_1bit BIT6 (.X(X), .Y(Y), .I(6), .Z(tempZ[6]));
   shift_left_1bit BIT7 (.X(X), .Y(Y), .I(7), .Z(tempZ[7]));
   shift_left_1bit BIT8 (.X(X), .Y(Y), .I(8), .Z(tempZ[8]));
   shift_left_1bit BIT9 (.X(X), .Y(Y), .I(9), .Z(tempZ[9]));
   shift_left_1bit BIT10 (.X(X), .Y(Y), .I(10), .Z(tempZ[10]));
   shift_left_1bit BIT11 (.X(X), .Y(Y), .I(11), .Z(tempZ[11]));
   shift_left_1bit BIT12 (.X(X), .Y(Y), .I(12), .Z(tempZ[12]));
   shift_left_1bit BIT13 (.X(X), .Y(Y), .I(13), .Z(tempZ[13]));
   shift_left_1bit BIT14 (.X(X), .Y(Y), .I(14), .Z(tempZ[14]));
   shift_left_1bit BIT15 (.X(X), .Y(Y), .I(15), .Z(tempZ[15]));
   shift_left_1bit BIT16 (.X(X), .Y(Y), .I(16), .Z(tempZ[16]));
   shift_left_1bit BIT17 (.X(X), .Y(Y), .I(17), .Z(tempZ[17]));
   shift_left_1bit BIT18 (.X(X), .Y(Y), .I(18), .Z(tempZ[18]));
   shift_left_1bit BIT19 (.X(X), .Y(Y), .I(19), .Z(tempZ[19]));
   shift_left_1bit BIT20 (.X(X), .Y(Y), .I(20), .Z(tempZ[20]));
   shift_left_1bit BIT21 (.X(X), .Y(Y), .I(21), .Z(tempZ[21]));
   shift_left_1bit BIT22 (.X(X), .Y(Y), .I(22), .Z(tempZ[22]));
   shift_left_1bit BIT23 (.X(X), .Y(Y), .I(23), .Z(tempZ[23]));
   shift_left_1bit BIT24 (.X(X), .Y(Y), .I(24), .Z(tempZ[24]));
   shift_left_1bit BIT25 (.X(X), .Y(Y), .I(25), .Z(tempZ[25]));
   shift_left_1bit BIT26 (.X(X), .Y(Y), .I(26), .Z(tempZ[26]));
   shift_left_1bit BIT27 (.X(X), .Y(Y), .I(27), .Z(tempZ[27]));
   shift_left_1bit BIT28 (.X(X), .Y(Y), .I(28), .Z(tempZ[28]));
   shift_left_1bit BIT29 (.X(X), .Y(Y), .I(29), .Z(tempZ[29]));
   shift_left_1bit BIT30 (.X(X), .Y(Y), .I(30), .Z(tempZ[30]));
   shift_left_1bit BIT31 (.X(X), .Y(Y), .I(31), .Z(tempZ[31]));
   
   // In the case where the MSB is set on Y, set_less_than will still
   // interpret values as signed. So correct for that here.
   mux_2to1 SPECIAL_CASE (.X(tempZ), .Y(32'b0), .C(Y[31]), .R(Z));

endmodule
`default_nettype wire
