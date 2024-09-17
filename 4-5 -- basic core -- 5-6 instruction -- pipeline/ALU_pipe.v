`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 04:31:38 PM
// Design Name: 
// Module Name: ALU_pipe
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


module ALU_pipe(
    input clk,
    input [7:0] A,
    input [7:0] B,
    input [3:0] control,
    output [7:0] ALU_out,
    output Cout,
    output [3:0] ctrl_out
    );
    
    wire [3:0] A_bit;
    wire [3:0] B_bit;
    wire [7:0] M_8bit;
    wire [7:0] Sum;
    
    wire [3:0] control2;
    
    subtractor_pipe #(.N(8)) adderr(
        .clk(clk),
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
    multiplier_pipe Multiply(
        .clk(clk),
        .A(A_bit),
        .B(B_bit),
        .son(M_8bit)
    );
    control_reg cr(
        .clk(clk),
        .control(control),
        .control2(control2)
    );
    control_reg creg(
        .clk(clk),
        .control(control2),
        .control2(ctrl_out)
    );
    
    mux_2x1_8bit ALU_mux(
        .S(ctrl_out[0]),
        .i0(Sum),
        .i1(M_8bit),
        .out(ALU_out)
    );
endmodule

module control_reg(
    input clk,
    input [3:0] control,
    output reg [3:0] control2
);
    always @(posedge clk) begin
        control2 <= control;
    end
endmodule




