`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 03:25:54 PM
// Design Name: 
// Module Name: uart_tx
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


module uart_tx(
    input [7:0] din,
    input send,
    input clk,
    input rst,
    output info,
    output reg done
    );
    
    reg [9:0] data;
    assign info = data[0];
    reg [1:0] state;
    reg [3:0] count;
    
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= 2'b00;
            data <= 10'b1111_1111_11;
            done <= 0;
        end else begin
            case (state)
                2'b00: begin
                    if (send) begin
                        count <= count + 1;
                        data <= {1'b1, din, 1'b0};
                        state = 2'b01;
                    end else begin
                        data <= 10'b1111_1111_11;
                    end 
                end
                1'b1: begin
                    data <= {1'b1, data[9:1]};
                    count <= count + 1;
                    if(count == 10) begin
                        state <= 2'b10;
                        done <= 1;
                    end
                end
                default: begin
                    state <= 2'b00;
                    count <= 0;
                    data = 10'b1111_1111_11;
                    done <= 0;
                end
            endcase
        end
     end
endmodule
