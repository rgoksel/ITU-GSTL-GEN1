`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 03:45:55 PM
// Design Name: 
// Module Name: core
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


module core(
    input clk,
    input rst,
    input [13:0] instraction,
    output [7:0] core_out,
    output [4:0] pc
    );
    
    wire [3:0] rd; 
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [7:0] imm;
    wire w;
    wire [3:0] control;
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] rd_data;
    wire [7:0] ALU_out;
    wire Cout;
    
    program_counter PC(
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );
        
    Decoder D(
        .inst(instraction),
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .imm(imm),
        .w(w),
        .control(control)
    );
    
    Reg_File reg_fd(
        .rd(rd),
        .rs1(rs1),
        .rs2(rs2),
        .imm(imm),
        .clk(clk),
        .rst(rst),
        .w(w),
        .A(A),
        .B(B),
        .rd_data(rd_data)
    );
    
    ALU alu(
        .A(A),
        .B(B),
        .control(control[2:0]),
        .ALU_out(ALU_out),
        .Cout(Cout)
    );
    
    mux_2x1_8bit MUX(
        .S(!control[3]),
        .i0(rd_data),
        .i1(ALU_out),
        .out(core_out)
    );
    
endmodule



