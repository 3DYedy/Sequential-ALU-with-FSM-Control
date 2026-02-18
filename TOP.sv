`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2026 03:14:33 AM
// Design Name: 
// Module Name: TOP
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

module TOP(
    input  logic clk,
    input  logic rst,
    input  logic [3:0] a, b,    
    input  logic [1:0] sel,      
    input  logic start,         
    output logic [3:0] result,  
    output logic ready          
);

    typedef enum logic [1:0] {IDLE, COMPUTE, DONE} state_t;
    state_t state, next_state;

    logic [3:0] alu_out;

    always_comb begin
        case (sel)
            2'b00: alu_out = a + b; 
            2'b01: alu_out = a - b; 
            2'b10: alu_out = a & b;  
            2'b11: alu_out = a ^ b;  
            default: alu_out = 4'b0000;
        endcase
    end

    always_ff @(posedge clk or negedge rst) begin
        if (!rst) 
            state <= IDLE;
        else 
            state <= next_state;
    end

    always_comb begin
        next_state = state;
        ready = 1'b0;
        
        case (state)
            IDLE: begin
                    if (start) next_state = COMPUTE;
                  end
            COMPUTE: begin
                        next_state = DONE;
                     end
            DONE: begin
                    ready = 1'b1;
                    next_state = IDLE;
                  end
        endcase
        
    end

    always_ff @(posedge clk) begin
        if (state == COMPUTE)
            result <= alu_out;
    end

endmodule

