`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 12:52:55 PM
// Design Name: 
// Module Name: ALU
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ALU(
    input [7:0] A,
    input [7:0] B,
    input [2:0] control, // ins 10 = a nýn hangi 4 biti //ins 11 == bnin hangi bitleri //ins 10 toplama mý çýkarma  mý
    output [7:0] ALU_out,
    output Cout
    );
    
    wire [3:0] A_bit;
    wire [3:0] B_bit;
    wire [7:0] M_8bit;
    wire [7:0] Sum;
    
    subtractor #(.N(8)) adderr(
        .A(A),
        .B(B),
        .Cin(control[2]),
        .Sum(Sum),
        .Cout(Cout)
    );
    mux_2x1_4bit A_Select(
        .S(control[2]),
        .i0(A[3:0]),
        .i1(A[7:4]),
        .out(A_bit)
    );
    mux_2x1_4bit B_Select(
        .S(control[1]),
        .i0(B[3:0]),
        .i1(B[7:4]),
        .out(B_bit)
    );
    Multiplier Multiply(
        .A(A_bit),
        .B(B_bit),
        .son(M_8bit)
    );
    mux_2x1_8bit ALU_mux(
        .S(control[0]),
        .i0(Sum),
        .i1(M_8bit),
        .out(ALU_out)
    );
endmodule

module mux_2x1_4bit(
    input S,
    input [3:0]i0,
    input [3:0] i1,
    output  [3:0] out
    );
    assign out = (S == 0 ? i0[3:0]: i1[3:0]);
endmodule

module mux_2x1_8bit(
    input S,
    input [7:0]i0,
    input [7:0] i1,
    output  [7:0] out
    );
    assign out = (S == 0 ? i0[7:0]: i1[7:0]);
endmodule



