`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 10:50:02 AM
// Design Name: 
// Module Name: full_adder_4bit
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


module full_adder_4bit(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
    );
    
    wire [2:0] Cins;
    
    full_adder fa0(
        .A(A[0]),
        .B(B[0]),
        .Cin(Cin),
        .Sum(Sum[0]),
        .Cout(Cins[0])
    );
    full_adder fa1(
        .A(A[1]),
        .B(B[1]),
        .Cin(Cins[0]),
        .Sum(Sum[1]),
        .Cout(Cins[1])
    );
    full_adder fa2(
        .A(A[2]),
        .B(B[2]),
        .Cin(Cins[1]),
        .Sum(Sum[2]),
        .Cout(Cins[2])
    );
    full_adder fa(
        .A(A[3]),
        .B(B[3]),
        .Cin(Cins[2]),
        .Sum(Sum[3]),
        .Cout(Cout)
    );      
endmodule
