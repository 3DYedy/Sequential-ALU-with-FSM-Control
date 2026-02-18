`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2026 03:15:19 AM
// Design Name: 
// Module Name: TOP_TB
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


module TOP_TB();

    logic clk_tb;
    logic rst_tb;
    logic [3:0] a_tb, b_tb;
    logic [1:0] sel_tb;
    logic start_tb;
    logic [3:0] result_tb;
    logic ready_tb;

    TOP dut (
        .clk(clk_tb),
        .rst(rst_tb),
        .a(a_tb),
        .b(b_tb),
        .sel(sel_tb),
        .start(start_tb),
        .result(result_tb),
        .ready(ready_tb)
    );

    always #5 clk_tb = ~clk_tb;

    initial begin
        clk_tb = 0;
        rst_tb = 0;
        start_tb = 0;
        a_tb = 4'd0;
        b_tb = 4'd0;
        sel_tb = 2'b00;

        #15 rst_tb = 1; 
        
        #10;
        a_tb = 4'd5; b_tb = 4'd3; sel_tb = 2'b00; start_tb = 1;
        #10 start_tb = 0;
        
        wait(ready_tb); 
        $display("Test Adunare: %d + %d = %d (Ready: %b)", a_tb, b_tb, result_tb, ready_tb);

        #20;
        a_tb = 4'b1010; b_tb = 4'b1100; sel_tb = 2'b11; start_tb = 1;
        #10 start_tb = 0;

        wait(ready_tb);
        $display("Test XOR: %b ^ %b = %b", a_tb, b_tb, result_tb);

        #50;
        $display("Simulare finalizata cu succes!");
        $finish;
    end

endmodule
