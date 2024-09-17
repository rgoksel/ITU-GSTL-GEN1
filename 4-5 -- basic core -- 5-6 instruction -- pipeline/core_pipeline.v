`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 12:01:05 PM
// Design Name: 
// Module Name: core_pipeline
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


module core_pipeline(
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
    wire [7:0] A;
    wire [7:0] B;
    wire [7:0] rd_data;
    wire [7:0] ALU_out;
    wire Cout;
    
    wire w2;
    wire [3:0] rd2;
    wire [3:0] rs12;
    wire [3:0] rs22;
    wire [7:0] imm2;
    wire [7:0] rd_data2;
    wire [7:0] A2;
    wire [7:0] B2;
    wire [7:0] ALU_out2;
    wire Cout2;
    wire [7:0] rd_data3;
    wire [7:0] core_out2;
    wire Cout3; 
    
    wire [3:0] control;
    wire [3:0] control2;
    wire [3:0] control3;
    wire [3:0] control4;
    wire [3:0] control5;
  
    
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
    
    reg_rf rf(
        .clk(clk),
        .rst(rst),
        .w1(w),
        .rd1(rd),
        .rs11(rs1),
        .rs21(rs2),
        .imm(imm),
        .control1(control),
        .w2(w2),
        .rd2(rd2),
        .rs12(rs12),
        .rs22(rs22),
        .imm2(imm2),
        .control2(control2)
    );

    Reg_File reg_fd(
        .rd(rd2),
        .rs1(rs12),
        .rs2(rs22),
        .imm(imm2),
        .clk(clk),
        .rst(rst),
        .w(w2),
        .A(A),
        .B(B),
        .rd_data(rd_data)
    );
    
    reg_ALU rA(
        .clk(clk),
        .rd_data1(rd_data),
        .A1(A),
        .B1(B),
        .control3(control2),
        .rd_data2(rd_data2),
        .A2(A2),
        .B2(B2),
        .control4(control3)
    );
    
    ALU_pipe alu(
        .clk(clk),
        .A(A2),
        .B(B2),
        .control(control3),
        .ALU_out(ALU_out),
        .Cout(Cout),
        .ctrl_out(control4)
    );
    
    reg_mux rm(
        .clk(clk),
        .ALU_out1(ALU_out),
        .Cout1(Cout),
        .rd_data3(rd_data2),
        .control5(control4), //
        .ALU_out2(ALU_out2),
        .Cout2(Cout2),
        .rd_data4(rd_data3),
        .control6(control5)
    );
    
    mux_2x1_8bit MUX(
        .S(!control5[3]),
        .i0(rd_data3),
        .i1(ALU_out2),
        .out(core_out)
    );
    
    reg_son rs(
        .clk(clk),
        .core_out1(core_out),
        .Cout3(Cout2),
        .core_out2(core_out2),
        .Cout4(Cout3)
    );
endmodule

module reg_rf(
    input clk,
    input rst,
    input w1,
    input [3:0] rd1,
    input [3:0] rs11,
    input [3:0] rs21,
    input [7:0] imm,
    input [3:0] control1,
    output reg w2,
    output reg [3:0] rd2,
    output reg [3:0] rs12,
    output reg [3:0] rs22,
    output reg [7:0] imm2,
    output reg [3:0] control2
    );

    always @(posedge clk) begin
        if (rst == 0)
            w2 <= 0;
        else begin
            w2 <= w1;
            rd2 <= rd1;
            rs12 <= rs11;
            rs22 <= rs21;
            imm2 <= imm;
            control2 <= control1;
        end
    end
endmodule 

module reg_ALU(
    input clk,
    input [7:0] rd_data1,
    input [7:0] A1,
    input [7:0] B1,
    input [3:0] control3,
    
    output reg [7:0] rd_data2,
    output reg [7:0] A2,
    output reg [7:0] B2,
    output reg [3:0] control4
    );
    always @(posedge clk) begin
        rd_data2 <= rd_data1;
        A2 <= A1;
        B2 <= B1;
        control4 <= control3; 
    end
endmodule

module reg_mux(
    input clk,
    input [7:0] ALU_out1,
    input Cout1,
    input [7:0] rd_data3,
    input [3:0] control5,
    
    output reg [7:0] ALU_out2,
    output reg Cout2,
    output reg [7:0] rd_data4,
    output reg [3:0] control6
    );
    always @(posedge clk) begin
         ALU_out2 <= ALU_out1;
         Cout2 <= Cout1;
         rd_data4 <= rd_data3;
         control6 <= control5;
    end
endmodule

module reg_son(
    input clk,
    input [7:0] core_out1,
    input Cout3,
    output reg [7:0] core_out2,
    output reg Cout4
    
);

always @(posedge clk) begin
    core_out2 <= core_out1;
    Cout4 <= Cout3;
end
endmodule