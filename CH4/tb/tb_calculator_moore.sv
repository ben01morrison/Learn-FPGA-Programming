`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/03/2024 03:15:08 PM
// Design Name: 
// Module Name: tb_calculator
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


module tb_calculator;
    logic               clk;
    logic               start;
    logic [4:0]         buttons;
    logic [15:0]        switch;
    logic                done;
    logic                accum;

    
    calculator_moore u_calculator (.*);

    initial begin
        clk = 0; // Initialize clock signal
        forever #5 clk = ~clk; // Toggle clock every 5 time units (e.g., 10ns period for 100MHz clock)
    end

    initial begin
        start = '0;
        buttons = '0;
        switch = '0;
        repeat (5) @(posedge clk); // Wait 5 clock cycles
        switch = 16'h04_02;
        buttons = 5'b00001;
        start = '1;
        repeat (5) @(posedge clk);
        start <= '0;
        
        repeat (5) @(posedge clk);
        $stop;
    end
    
endmodule
