`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2024 10:40:20 AM
// Design Name: 
// Module Name: full_adder
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


module full_adder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
    
    (* dont_touch = "true"  *) assign Sum = (A^B) ^ Cin;
    (* dont_touch = "true"  *) assign Cout = ((A^B) & Cin) | (A&B);
   
endmodule
