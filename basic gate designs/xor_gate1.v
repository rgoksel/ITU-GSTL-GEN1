`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:38:08 PM
// Design Name: 
// Module Name: xor_gate1
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


module xor_gate1(
    input A,
    input B,
    output Q
    );
    
    wire out1;
    wire out2;
    wire out3;
    wire out4;

    
    not_gate1 not1(
        .A(A),
        .Out(out1)
    );
    
    not_gate1 not2(
        .A(B),
        .Out(out2)
    ); 
    
    and_gate and1(
        .A(A),
        .B(out2),
        .Q(out3)
    );
    
    and_gate and2(
        .A(B),
        .B(out1),
        .Q(out4)
    );
    
    or_gate1 or1(
        .A(out3),
        .B(out4),
        .Q(Q)
    );
       
endmodule
