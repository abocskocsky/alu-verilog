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

   wire [31:0] tempZ;
   shift_right_1bit BIT0 (.X(X), .Y(Y), .I(0), .V(X[31]), .Z(tempZ[0]));
   shift_right_1bit BIT1 (.X(X), .Y(Y), .I(1), .V(X[31]), .Z(tempZ[1]));
   shift_right_1bit BIT2 (.X(X), .Y(Y), .I(2), .V(X[31]), .Z(tempZ[2]));
   shift_right_1bit BIT3 (.X(X), .Y(Y), .I(3), .V(X[31]), .Z(tempZ[3]));
   shift_right_1bit BIT4 (.X(X), .Y(Y), .I(4), .V(X[31]), .Z(tempZ[4]));
   shift_right_1bit BIT5 (.X(X), .Y(Y), .I(5), .V(X[31]), .Z(tempZ[5]));
   shift_right_1bit BIT6 (.X(X), .Y(Y), .I(6), .V(X[31]), .Z(tempZ[6]));
   shift_right_1bit BIT7 (.X(X), .Y(Y), .I(7), .V(X[31]), .Z(tempZ[7]));
   shift_right_1bit BIT8 (.X(X), .Y(Y), .I(8), .V(X[31]), .Z(tempZ[8]));
   shift_right_1bit BIT9 (.X(X), .Y(Y), .I(9), .V(X[31]), .Z(tempZ[9]));
   shift_right_1bit BIT10 (.X(X), .Y(Y), .I(10), .V(X[31]), .Z(tempZ[10]));
   shift_right_1bit BIT11 (.X(X), .Y(Y), .I(11), .V(X[31]), .Z(tempZ[11]));
   shift_right_1bit BIT12 (.X(X), .Y(Y), .I(12), .V(X[31]), .Z(tempZ[12]));
   shift_right_1bit BIT13 (.X(X), .Y(Y), .I(13), .V(X[31]), .Z(tempZ[13]));
   shift_right_1bit BIT14 (.X(X), .Y(Y), .I(14), .V(X[31]), .Z(tempZ[14]));
   shift_right_1bit BIT15 (.X(X), .Y(Y), .I(15), .V(X[31]), .Z(tempZ[15]));
   shift_right_1bit BIT16 (.X(X), .Y(Y), .I(16), .V(X[31]), .Z(tempZ[16]));
   shift_right_1bit BIT17 (.X(X), .Y(Y), .I(17), .V(X[31]), .Z(tempZ[17]));
   shift_right_1bit BIT18 (.X(X), .Y(Y), .I(18), .V(X[31]), .Z(tempZ[18]));
   shift_right_1bit BIT19 (.X(X), .Y(Y), .I(19), .V(X[31]), .Z(tempZ[19]));
   shift_right_1bit BIT20 (.X(X), .Y(Y), .I(20), .V(X[31]), .Z(tempZ[20]));
   shift_right_1bit BIT21 (.X(X), .Y(Y), .I(21), .V(X[31]), .Z(tempZ[21]));
   shift_right_1bit BIT22 (.X(X), .Y(Y), .I(22), .V(X[31]), .Z(tempZ[22]));
   shift_right_1bit BIT23 (.X(X), .Y(Y), .I(23), .V(X[31]), .Z(tempZ[23]));
   shift_right_1bit BIT24 (.X(X), .Y(Y), .I(24), .V(X[31]), .Z(tempZ[24]));
   shift_right_1bit BIT25 (.X(X), .Y(Y), .I(25), .V(X[31]), .Z(tempZ[25]));
   shift_right_1bit BIT26 (.X(X), .Y(Y), .I(26), .V(X[31]), .Z(tempZ[26]));
   shift_right_1bit BIT27 (.X(X), .Y(Y), .I(27), .V(X[31]), .Z(tempZ[27]));
   shift_right_1bit BIT28 (.X(X), .Y(Y), .I(28), .V(X[31]), .Z(tempZ[28]));
   shift_right_1bit BIT29 (.X(X), .Y(Y), .I(29), .V(X[31]), .Z(tempZ[29]));
   shift_right_1bit BIT30 (.X(X), .Y(Y), .I(30), .V(X[31]), .Z(tempZ[30]));
   shift_right_1bit BIT31 (.X(X), .Y(Y), .I(31), .V(X[31]), .Z(tempZ[31]));
   
   // Special cases: if X == -1, then the result is 0.
   //                if Y > 31 || Y < 0 (signed), the result is 0
   wire [31:0] test_minus1;
   wire [1:0] spec_cases;
   wire temp, test_gt31, test_lt0;
   add_32bit TEST_MINUS1_ADD (.X(X), .Y(32'b1), .Z(test_minus1), .C_IN(1'b0), .C_OUT(temp));
   set_less_than_32bit LT0 (.X(Y), .Y(32'b0), .Z(test_lt0));
   set_less_than_32bit GT31 (.X(32'd31), .Y(Y), .Z(test_gt31));
   assign spec_cases[0] = test_minus1 ? 0 : 1;
   assign spec_cases[1] = test_gt31 | test_lt0;

   mux_4to1 SPECIALCASES (.W(tempZ), .X(32'b0), .Y(32'b0), .Z(32'b0), .C(spec_cases), .R(Z));

endmodule
`default_nettype wire
