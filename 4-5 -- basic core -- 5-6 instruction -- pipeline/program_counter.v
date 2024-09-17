`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 03:02:29 PM
// Design Name: 
// Module Name: program_counter
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

module program_counter(
    input clk,
    input rst,
    output  reg [4:0] pc
    );
        
    always @(posedge clk or negedge rst) begin
        if (!rst)
            pc <= 0;
        else    
            pc <= pc + 1;
    end
endmodule
