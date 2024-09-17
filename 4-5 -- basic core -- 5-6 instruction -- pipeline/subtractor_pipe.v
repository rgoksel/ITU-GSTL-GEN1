`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 04:03:54 PM
// Design Name: 
// Module Name: subtractor_pipe
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


module subtractor_pipe #(parameter N=8)(
    input clk,
    input [N-1: 0] A,
    input [N-1: 0] B,
    input Cin,
    output [N-1: 0] Sum,
    output Cout
    );
    
    wire [N:0] c;
    wire [N-1:0] BxorC;
    
    wire [N-1:0] S1;
    wire [N-1: 0] S2;

    
    genvar i;
    
    generate
        for (i = 0; i < N; i = i + 1) begin
            assign BxorC[i] = Cin ^ B[i]; 
            full_adder FA(
                .A(A[i]),
                .B(BxorC[i]),
                .Cin(i == 0 ? Cin : c[i]),
                .Sum(S1[i]),
                .Cout(c[i+1])
            );
        end
    endgenerate
    assign Cout = c[N];
    
    reg_subtractor rsub1(
        .clk(clk),
        .sum1(S1),
        .sum2(S2)
    );
    reg_subtractor rsub2(
        .clk(clk),
        .sum1(S2),
        .sum2(Sum)
    );
    
endmodule

module reg_subtractor #(parameter N = 8)(
    input clk,
    input [N-1:0] sum1,
    output reg [N-1:0] sum2
    );
    always @(posedge clk) begin
        sum2 <= sum1;
    end
endmodule

