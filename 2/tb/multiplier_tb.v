`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 05:31:07 PM
// Design Name: 
// Module Name: multiplier_tb
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


module multiplier_tb();

    reg [3 : 0] A;
    reg [3 : 0] B;
    wire [7 : 0] son;

    Multiplier uut(
        .A(A),
        .B(B),
        .son(son)
    );
    
    initial begin
   
        A = 10;
        B = 15;
        #5;   
        A = 12;
        B = 8;
        #5; 
        A = 7;
        B = 5;
        #5;
        A = 5;
        B = 9;
        #5; 
        A = 13;
        B = 9;
        #5; 
        $finish;
   
    end
endmodule
