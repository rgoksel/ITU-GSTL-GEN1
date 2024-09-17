`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/08/2024 03:18:16 PM
// Design Name: 
// Module Name: core_tb
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


module core_tb();
    reg clk;
    reg rst;
    wire [4:0] pc;
    wire [13:0] instraction_;
    wire [7:0] core_out;
    reg [13:0] instraction_mem[31:0];
    
    core core_tb(
        .clk(clk),
        .rst(rst),
        .instraction(instraction_),
        .core_out(core_out),
        .pc(pc)
    );
    
    always #1 clk = ~clk;

    initial begin
        $readmemb("instractions.MEM", instraction_mem);
        rst = 0;
        clk = 0;
        #5;
        rst = 1;
        #60;
        $finish(); 
    end
    assign instraction_ = instraction_mem[pc];
    
endmodule
