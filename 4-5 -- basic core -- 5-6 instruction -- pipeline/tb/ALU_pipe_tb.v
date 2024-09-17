`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 05:15:56 PM
// Design Name: 
// Module Name: ALU_pipe_tb
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


module ALU_pipe_tb();
    reg clk;
    reg [7:0] A;
    reg [7:0] B;
    reg [2:0] control;
    wire [7:0] ALU_out;
    wire Cout;
    
    ALU_pipe tb(
        .clk(clk),
        .A(A),
        .B(B),
        .control(control),
        .ALU_out(ALU_out),
        .Cout(Cout)
    );
    
    always #1 clk = ~clk;

    initial begin
        clk = 0;
        A = 5;
        B = 12;
        control = 2'b11;
        #25;
        A = 7;
        B = 12;
        control = 2'b01;
        #25;
        A = 6;
        B = 10;
        control = 2'b00;
        #25;
        $finish;
    end
endmodule
