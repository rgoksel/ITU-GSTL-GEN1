`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 02:52:05 PM
// Design Name: 
// Module Name: pieline_tb
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


module pipeline_tb();
    reg clk;
    reg rst;
    wire [4:0] pc;
    wire [13:0] instraction_;
    wire [7:0] core_out;
    reg [13:0] instraction_mem[31:0];
    
    core_pipeline core_tb(
        .clk(clk),
        .rst(rst),
        .instraction(instraction_),
        .core_out(core_out),
        .pc(pc)
    );
    
    always #1 clk = ~clk;

    initial begin
        $readmemb("instractions.MEM", instraction_mem);
        clk = 0;
        rst = 1;
        #60;
        $finish(); 
    end
    assign instraction_ = instraction_mem[pc];
    


endmodule
