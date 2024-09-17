`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 11:57:04 AM
// Design Name: 
// Module Name: Reg_File
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


module Reg_File(
    input [3:0] rd,
    input [3:0] rs1,
    input [3:0] rs2,
    input [7:0] imm,
    input clk,
    input rst,
    input w,
    output [7:0] A,
    output [7:0] B,
    output[7:0] rd_data
    );
    
    integer i;
    reg [7:0] register_file [15:0];
    
    assign rd_data = (w) ? imm : register_file[rd];
    assign A = register_file[rs1];
    assign B = register_file[rs2];

    
    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            for (i = 0; i < 16; i = i + 1) begin
                register_file[i] <= 0;
            end
        end
        else if (w) begin
            register_file[rd] <= imm;
        end
    end
    
endmodule

