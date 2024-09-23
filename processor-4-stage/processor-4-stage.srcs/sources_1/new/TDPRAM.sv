`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/16/2024 11:52:33 AM
// Design Name: 
// Module Name: TDPRAM_D256_W8
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


module TDPRAM_D256_W8(
    input [$clog2(256):0] address_a,
    input [$clog2(256):0] address_b,
    input [7:0] write_data_a,
    input [7:0] write_data_b,
    output [7:0] read_data_a,
    output [7:0] read_data_b,
    input write_enable_a,
    input write_enable_b
    );
    
    localparam WIDTH = 8;
    localparam DEPTH = 256;
    logic[WIDTH-1:0]            memory[DEPTH];
    initial memory = '{default: '0};
    
    
    
    
endmodule
