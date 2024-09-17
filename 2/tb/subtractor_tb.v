`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 03:04:02 PM
// Design Name: 
// Module Name: subtractor_tb
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


module subtractor_tb();

    reg [31 : 0] A;
    reg [31: 0] B;
    reg Cin;
    wire [31: 0] Sum;
    wire Cout;

    subtractor uut(
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );
    
    initial begin
   
        A = 465;
        B = 100;
        Cin = 1;
        #5;   
        A = 895;
        B = 100;
        Cin = 0;
        #5; 
        A = 245;
        B = 52;
        Cin = 0;
        #5;
        A = 5;
        B = 2;
        Cin = 1;
        #5; 
        A = 800;
        B = 5254;
        Cin = 1;
        #5; 
        $finish;
   
    end

endmodule
