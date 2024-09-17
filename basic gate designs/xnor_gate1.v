`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:51:03 PM
// Design Name: 
// Module Name: xnor_gate1
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


module xnor_gate1(
    input A,
    input B,
    output Q
    );
    
    wire out1;
    
    xor_gate1 xor1(
        .A(A),
        .B(B),
        .Q(out1)
    );
    not_gate1 not1(
        .A(out1),
        .Out(Q)
    );
endmodule
