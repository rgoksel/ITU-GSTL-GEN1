`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:39:13 PM
// Design Name: 
// Module Name: and_gate
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


module and_gate(
    input A,
    input B,
    output Q
    );
    
    wire out1;
    
    Nand_G and1(
        .A(A),
        .B(B),
        .C(out1)
    );
    Nand_G and2(
        .A(out1),
        .B(out1),
        .C(Q)
    );
    
endmodule
