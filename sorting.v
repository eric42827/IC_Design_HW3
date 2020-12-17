`timescale 1ns/1ps

module sorting(rank0, rank1, rank2, rank3, rank4, i0, i1, i2, i3, i4);
//DO NOT CHANGE!
	input  [5:0] i0, i1, i2, i3, i4;
	output [5:0] rank0, rank1, rank2, rank3, rank4;
//---------------------------------------------------
	wire [9:0]G, E;
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
	//rank0
	wire [5:0]a, b, c, d, e;
	Rank1 R0(a, G[0], G[1], G[2], G[3], i0);
	

	Sum sum0(rank0, a, b, c, d, e);
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
	NR2 nr2(R[0], w[0], w[1]);
endmodule

module Sum(R, A, B, C, D, E);
input [5:0]A, B, C, D, E;
output [5:0]R;

endmodule

module OR5(W, A, B, C, D, E);
input A, B, C, D, E;
output W;

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