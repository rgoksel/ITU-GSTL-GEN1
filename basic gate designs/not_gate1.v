`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 02:32:30 PM
// Design Name: 
// Module Name: not_gate1
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


module not_gate1(
    input A,
    output Out
    );
    
   Nand_G not_g(
        .A(A),
        .B(A),
        .C(Out)
   );
   
endmodule
