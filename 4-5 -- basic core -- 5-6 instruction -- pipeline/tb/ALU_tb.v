`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 01:51:50 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] control;
    wire [7:0] ALU_out;
    wire Cout;
    
    ALU alu(
        .A(A),
        .B(B),
        .control(control),
        .ALU_out(ALU_out),
        .Cout(Cout)
    );
    
    initial begin
        A = 9;
        B = 5;
        control = 3'b110;
    end
    
endmodule
