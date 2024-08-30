`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 02:00:44 PM
// Design Name: 
// Module Name: direction_lock
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


module direction_lock
    #
    (
    parameter NUM_SEGMENTS = 4,
    parameter CLK_PER      = 10,  // Clock period in ns
    parameter REFR_RATE    = 1000 // Refresh rate in Hz
    )
    (
    input wire                        clk,
    input wire                        CPU_RESETSW, //RESET SW
    input wire [3:0]                  BUTTONS,
    // output logic [NUM_SEGMENTS-1:0][3:0] encoded, // How do I only include these two outputs for simulation
    // output logic                    pressed,
    output logic [NUM_SEGMENTS-1:0]   anode, // 7 segment display ports
    output logic [7:0]                cathode,
    output logic [15:0]               LED,
    output logic [1:0]                         input_index, //RM
    output logic [NUM_SEGMENTS-1:0][3:0]       encoded // REMOVE FOR IMPLAMENTATION
    ); 

    

    //7 Segment Setup

    logic [NUM_SEGMENTS-1:0]            digit_point;
    //logic [NUM_SEGMENTS-1:0][3:0]       encoded;
    logic [3:0]                         pressed;
    logic [3:0][3:0]                    user_input; 
    logic [3:0][3:0]                    pwd; 
    logic [1:0]                         input_index;
    
    

    seven_segment
    #
    (
     .NUM_SEGMENTS (NUM_SEGMENTS),
     .CLK_PER      (CLK_PER),   // Clock period in ns
     .REFR_RATE    (REFR_RATE)  // Refresh rate in Hz
    )
    u_7seg
    (
     .clk          (clk),
     .encoded      (encoded),
     .digit_point  (digit_point),
     .anode        (anode),
     .cathode      (cathode)
     );

     debouncer
     #
     (
        .POS_EDGE (1)
     )
     button[4]
     (
        .button_in (BUTTONS),
        .clk       (clk),
        .pressed   (pressed)
     );




initial begin
    encoded <= 0;
    input_index <= 0;
    user_input <= 0;
    LED <= 16'h000F;
    pwd[0] <= 4'h4; //pwd: 1,2,3,4 up left right down
    pwd[1] <= 4'h3;
    pwd[2] <= 4'h2;
    pwd[3] <= 4'h1;
end
    
 
     always @(posedge clk) begin
        
        if(CPU_RESETSW) begin
                encoded <= 0;
                input_index <= 0;
                user_input <= 0;
                LED <= 16'h00FF;
                pwd[0] <= 2'b11; //pwd: 3, 2, 1, 0 or up, right, down, left.
                pwd[1] <= 2'b10;
                pwd[2] <= 2'b01;
                pwd[3] <= 2'b00;
        end  
        
        if(pressed != 0) begin //FIXME
            //Store User input
            $display("Pressed: ");
            $display(pressed);
            case(pressed)
                4'b0001: user_input[input_index] <= 4'h4; //Up
                4'b0010: user_input[input_index] <= 4'h3; //Right
                4'b0100: user_input[input_index] <= 4'h2; //Down
                4'b1000: user_input[input_index] <= 4'h1; //Left
            endcase
            $display("User input: ");
            $display(user_input);
            input_index <= input_index + 1;
            //update seven segment
            encoded <= user_input;
            
            //check unlock
            if(input_index == 3) begin
                if(user_input == pwd) begin
                    LED <= '1;
                end else begin
                    LED <= '0;
                end
            end
        end 
     end

endmodule