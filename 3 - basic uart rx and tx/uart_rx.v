`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 01:40:26 PM
// Design Name: 
// Module Name: uart
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


module uart(
    input info,
    input clk, 
    input rst,
    output reg [7:0] out
    );
    
    reg [2:0] count = 3'b000;
    reg [1:0] state = 3'b000; //idle state
    reg [7:0] data;
    
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            count = 0;
            state = 3'b000;
            out = 8'b0;
        end else begin
            case (state)
                2'b00: begin
                    if (info == 0)
                        state <= 2'b01;
                    else
                        state <= 2'b00;
                end
                2'b01: begin
                    if(count == 3'b111) begin
                        count <= 3'b000;
                        data[count] <= info;
                        state <= 2'b10;
                    end else begin
                        count <= count + 1;
                        data[count] <= info;
                        state <= 2'b01;
                    end
                end
                2'b10: begin
                    state <= 2'b00;
                    out <= data;
                end
            endcase
        end
    end  
endmodule
