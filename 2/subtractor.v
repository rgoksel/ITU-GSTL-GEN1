`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 02:51:55 PM
// Design Name: 
// Module Name: subtractor
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


module subtractor  #(parameter N=32)(
    input [N-1: 0] A,
    input [N-1: 0] B,
    input Cin,
    output [N-1: 0] Sum,
    output Cout
    );
    
    wire [N:0] c;
    wire [N-1:0] BxorC;
    
    genvar i;
    
    generate
        for (i = 0; i < N; i = i + 1) begin
            assign BxorC[i] = Cin ^ B[i]; 
            full_adder FA(
                .A(A[i]),
                .B(BxorC[i]),
                .Cin(i == 0 ? Cin : c[i]),
                .Sum(Sum[i]),
                .Cout(c[i+1])
            );
        end
    endgenerate
    assign Cout = c[N];
endmodule
