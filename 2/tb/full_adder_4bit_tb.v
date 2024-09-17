`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 11:02:51 AM
// Design Name: 
// Module Name: full_adder_4bit_tb
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


module full_adder_4bit_tb();

    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [2:0] Sum;
    wire Cout;
    
    full_adder_4bit uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    initial begin
        A = 5;
        B = 3;
        Cin = 0;
        #5;
        
        A = 2;
        B = 4;
        Cin = 1;
        #5;
        
        A = 6;
        B = 8;
        Cin = 1;
        #5;
        
        A = 2;
        B = 1;
        Cin = 1;
        #5;
        
        A = 9;
        B = 7;
        Cin = 1;
        #5;
        $finish;
    end
endmodule
