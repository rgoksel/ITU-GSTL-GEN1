`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 04:35:50 PM
// Design Name: 
// Module Name: mux_design
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


module mux_design(
    input A,
    input B, 
    input btn,
    input clk,
    input [1:0] S,
    input rst, 
    output reg Q1,
    output reg Q2
    );
    
    wire [3:0] out1;
    wire out2;
    reg btn_previous;
    
    assign out1[0] = A & B;
    assign out1[1] = A | B;
    assign out1[2] = A ^ B;
    assign out1[3] = ~A;

    mux4x1 mux1(
        .S0(S[0]),
        .S1(S[1]),
        .i0(out1[0]),
        .i1(out1[1]),
        .i2(out1[2]),
        .i3(out1[3]),
        .out(out2)
    );
    
    always @(posedge clk or posedge rst) begin // bradaki or ikisinde birini high olmasý durumunu saðlýyor
        if (rst == 1) begin
            Q1 <= 0;
            Q2 <= 0;
        end
        else begin
            if (btn && !btn_previous) begin
                Q1 <= out2;
                Q2 <= Q1;
            end
            btn_previous <= btn;
        end
    end
endmodule
