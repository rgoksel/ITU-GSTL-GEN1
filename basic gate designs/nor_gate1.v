`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:20:41 PM
// Design Name: 
// Module Name: nor_gate1
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


module nor_gate1(
    input A,
    input B,
    output Q
    );
    
    wire out1;
    
    or_gate1 or1(
        .A(A),
        .B(B),
        .Q(out1)
    );
    
    not_gate1 not1(
        .A(out1),
        .Out(Q)
    );

endmodule
