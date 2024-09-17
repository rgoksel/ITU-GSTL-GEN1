`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 01:21:26 PM
// Design Name: 
// Module Name: full_adder_32bit
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


module full_adder_32bit #(parameter N=32)(
    input [N-1: 0] A,
    input [N-1: 0] B,
    input Cin,
    output [N-1: 0] Sum,
    output Cout
    );
    
    wire c[N-2:0];
    
    genvar i;
    
    generate
        for (i = 0; i < N; i = i + 1) begin
            if (i == 0) begin
                full_adder FA0(
                    .A(A[0]),
                    .B(B[0]),
                    .Cin(Cin),
                    .Sum(Sum[0]),
                    .Cout(c[0])
                );
            end else if ((i > 0) && (i < N - 1)) begin
                full_adder FA2(
                    .A(A[i]),
                    .B(B[i]),
                    .Cin(c[i-1]),
                    .Sum(Sum[i]),
                    .Cout(c[i])
                );
            end else begin
                full_adder FA1(
                    .A(A[N-1]),
                    .B(B[N-1]),
                    .Cin(c[N-2]),
                    .Sum(Sum[N-1]),
                    .Cout(Cout)
                );
            end
        end
    endgenerate    
endmodule
