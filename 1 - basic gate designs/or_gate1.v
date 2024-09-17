`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 03:00:41 PM
// Design Name: 
// Module Name: or_gate1
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


module or_gate1(
    input A,
    input B,
    output Q
    );
    
    wire out1;
    wire out2;
    wire out3;
    
    not_gate1 not1(
        .A(A),
        .Out(out1)
    );
    
    not_gate1 not2(
        .A(B),
        .Out(out2)
    );
    
    and_gate and1(
        .A(out1),
        .B(out2),
        .Q(out3)
    );
    
    not_gate1 not3(
        .A(out3),
        .Out(Q)
    );
         
endmodule
