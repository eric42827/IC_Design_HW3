`timescale 1ns/1ps

module sorting(rank0, rank1, rank2, rank3, rank4, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4;
	output [5:0] rank0, rank1, rank2, rank3, rank4;
//---------------------------------------------------
	wire [19:0]G, E;
	Comp comp0(G[0], E[0], i0, i1);
	Comp comp1(G[1], E[1], i0, i2);
	Comp comp2(G[2], E[2], i0, i3);
	Comp comp3(G[3], E[3], i0, i4);
	Comp comp4(G[4], E[4], i1, i2);
	Comp comp5(G[5], E[5], i1, i3);
	Comp comp6(G[6], E[6], i1, i4);
	Comp comp7(G[7], E[7], i2, i3);
	Comp comp8(G[8], E[8], i2, i4);
	Comp comp9(G[9], E[9], i3, i4);

	Comp comp10(G[10], E[10], i1, i0);
	Comp comp11(G[11], E[11], i2, i0);
	Comp comp12(G[12], E[12], i3, i0);
	Comp comp13(G[13], E[13], i4, i0);
	Comp comp14(G[14], E[14], i2, i1);
	Comp comp15(G[15], E[15], i3, i1);
	Comp comp16(G[16], E[16], i4, i1);
	Comp comp17(G[17], E[17], i3, i2);
	Comp comp18(G[18], E[18], i4, i2);
	Comp comp19(G[19], E[19], i4, i3);

	//rank0
	wire [5:0]a0, b0, c0, d0, e0;
	Rank1 R00(a0, G[0], G[1], G[2], G[3], i0);
	Rank1 R01(b0, G[10], G[4], G[5], G[6], i1);
	Rank1 R02(c0, G[11], G[14], G[7], G[8], i2);
	Rank1 R03(d0, G[12], G[15], G[17], G[9], i3);
	Rank1 R04(e0, G[13], G[16], G[18], G[19], i4);
	Sum sum0(rank0, a0, b0, c0, d0, e0);

	//rank1
	wire [5:0]a1, b1, c1, d1, e1;
	wire [5:0]a10, a11, a12, a13;
	wire [5:0]b10, b11, b12, b13;
	wire [5:0]c10, c11, c12, c13;
	wire [5:0]d10, d11, d12, d13;
	wire [5:0]e10, e11, e12, e13;

	Rank1 R10a(a10, G[10], G[1], G[2], G[3], i0);
	Rank1 R10b(a11, G[0], G[11], G[2], G[3], i0);
	Rank1 R10c(a12, G[0], G[1], G[12], G[3], i0);
	Rank1 R10d(a13, G[0], G[1], G[2], G[13], i0);
	Sum suma(a1, a10, a11, a12, a13);
	Rank1 R11a(b10, G[0], G[4], G[5], G[6], i1);
	Rank1 R11b(b11, G[10], G[14], G[5], G[6], i1);
	Rank1 R11b(b12, G[10], G[4], G[15], G[6], i1);
	Rank1 R11d(b13, G[10], G[4], G[5], G[16], i1);
	Sum sumb(b1, b10, b11, b12, b13);
	Rank1 R12a(c10, G[1], G[14], G[7], G[8], i2);
	Rank1 R12b(c11, G[11], G[4], G[7], G[8], i2);
	Rank1 R12b(c12, G[11], G[14], G[17], G[8], i2);
	Rank1 R12d(c13, G[11], G[14], G[7], G[18], i2);
	Sum sumc(c1, c10, c11, c12, c13);
	Rank1 R13a(d10, G[2], G[15], G[17], G[9], i3);
	Rank1 R13b(d11, G[12], G[5], G[17], G[9], i3);
	Rank1 R13b(d12, G[12], G[15], G[7], G[9], i3);
	Rank1 R13d(d13, G[12], G[15], G[17], G[19], i3);
	Sum sumb(d1, d10, d11, d12, d13);
	Rank1 R14a(e10, G[3], G[16], G[18], G[19], i4);
	Rank1 R14b(e11, G[13], G[6], G[18], G[19], i4);
	Rank1 R14b(e12, G[13], G[16], G[8], G[19], i4);
	Rank1 R14d(e13, G[13], G[16], G[18], G[9], i4);
	Sum sume(e1, e10, e11, e12, e13);
	Sum sum1(rank1, a1, b1, c1, d1, e1);
	//rank4
	wire [5:0]a4, b4, c4, d4, e4;
	Rank1 R40(a4, G[10], G[11], G[12], G[13], i0);
	Rank1 R41(b4, G[0], G[14], G[15], G[16], i1);
	Rank1 R42(c4, G[1], G[4], G[17], G[18], i2);
	Rank1 R43(d4, G[2], G[5], G[7], G[19], i3);
	Rank1 R44(e4, G[3], G[6], G[8], G[9], i4);
	Sum sum4(rank4, a4, b4, c4, d4, e4);

endmodule

module Rank1(C, G, I);//C=G*I (6bit)
	input [3:0]G;
	input [5:0]I;
	output [5:0]C;
	AN5 nd0(C[0],G,I[0]);
	AN5 nd1(C[1],G,I[1]);
	AN5 nd2(C[2],G,I[2]);
	AN5 nd3(C[3],G,I[3]);
	AN5 nd4(C[4],G,I[4]);
	AN5 nd5(C[5],G,I[5]);
endmodule

module AN5(W,G,I);
	input [3:0]G;
	input I;
	output W;
	wire [1:0]w;
	ND2 nd2(w[0], G[0], I);
	ND3 nd3(w[1], G[1], G[2], G[3]);
	NR2 nr2(W[0], w[0], w[1]);
endmodule

module Sum(R, A, B, C, D, E);
	input [5:0]A, B, C, D, E;
	output [5:0]R;
	OR5 or0(R[0], A[0], B[0], C[0], D[0], E[0]);
	OR5 or1(R[1], A[1], B[1], C[1], D[1], E[1]);
	OR5 or2(R[2], A[2], B[2], C[2], D[2], E[2]);
	OR5 or3(R[3], A[3], B[3], C[3], D[3], E[3]);
	OR5 or4(R[4], A[4], B[4], C[4], D[4], E[4]);
	OR5 or5(R[5], A[5], B[5], C[5], D[5], E[5]);

endmodule

module OR5(W, A, B, C, D, E);
	input A, B, C, D, E;
	output W;
	wire [1:0]w;
	NR2 nr2(w[0], A, B, C);
	NR3 nr3(w[1], D, E);
	ND2 nd2(W, w[0], w[1]);

endmodule


module Comp1(G, E, A, B);
	output G, E;
	input A, B;
	wire w;
	EO2 eo0(w, A, B);
	IV iv0(E, w);
	AN2 an2(G, a, inb);
endmodule


module Comp3(G3, E3, A, B);
	output G3, E3;
	input [2:0]A, B;
	wire [2:0]G, E;
	Comp1 comp1(G[0], E[0], A[0], B[0]);
	Comp1 comp2(G[1], E[1], A[1], B[1]);
	Comp1 comp3(G[2], E[2], A[2], B[2]); //MSB
	
	AN3 an0(E3,E); //E3
	
	wire [2:0]w; //G3
	IV in0(w[2], G[2]);
	ND2 nd0(w[1], G[1], E[2]);
	ND3 nd1(w[0], G[0], E[2], E[1]);
	ND3 nd2(G3, w);
endmodule

module Comp(G6, E6, A, B);
	output G6, E6;
	inout [5:0]A, [5:0]B;
	wire [1:0]G, E;
	Comp3 c1(G[1], E[1], A[5:3], B[5:3]);
	Comp3 c0(G[0], E[0], A[2:0], B[2:0]);
	
	AN2 an0(E6, E); //E6
	
	wire [1:0]w;
	IV in0(w[1], G[1]);
	ND2 nd0(w[0], G[0], E[1]);
	ND2 nd1(E6, w);
endmodule