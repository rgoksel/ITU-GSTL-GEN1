`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 02:16:38 PM
// Design Name: 
// Module Name: FA_32bit_tb
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


module FA_32bit_tb();
    reg [31 : 0] A;
    reg [31: 0] B;
    reg Cin;
    wire [31: 0] Sum;
    wire Cout;

    full_adder_32bit uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    initial begin
   
        A = 5465;
        B = 52;
        Cin = 0;
        #5;   
        A = 5895;
        B = 52;
        Cin = 0;
        #5; 
        A = 245;
        B = 52;
        Cin = 0;
        #5;
        A = 5;
        B = 2;
        Cin = 0;
        #5; 
        A = 8;
        B = 5254;
        Cin = 1;
        #5; 
        $finish;
   
    end
    
endmodule
