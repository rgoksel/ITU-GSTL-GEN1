`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/05/2024 01:04:39 PM
// Design Name: 
// Module Name: nand_gate
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


module Nand_G(
    input A,
    input B,
    output C
    );
    
    assign C = !(A & B);

endmodule

module Gate(
    input A,
    input B,
    input C,
    output D
    );
    
    wire out1;
    
    Nand_G Nand0(
        .A(A),
        .B(B),
        .C(out1)
       );
    Nand_G Nand1(
        .A(out1),
        .B(C),
        .C(D)
    );
       
 endmodule      
    


