
`timescale 1ns / 1ps

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
    output logic [NUM_SEGMENTS-1:0]   anode, // 7 segment display ports
    output logic [7:0]                cathode,
    output logic [15:0]               LED
    //output logic [1:0]                         input_index, //REMOVE FOR IMPLAMENTATION
    //output logic [NUM_SEGMENTS-1:0][3:0]       encoded, // RM
    //output logic [3:0]                         pressed, //RM
    //output logic [3:0][3:0]                    user_input, //RM
    //output logic [3:0][3:0]                    pwd //R
    ); 



    //7 Segment Setup

    logic [NUM_SEGMENTS-1:0]            digit_point;
    logic [NUM_SEGMENTS-1:0][3:0]       encoded;
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
        .POS_EDGE (1),
        .CTR_BITS (8)
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
    LED <= 16'h00FF;
    digit_point <= '0;
    pwd <= 16'h1234; //pwd: 1,2,3,4 up left right down
end
    
 
always @(posedge clk) begin
        
        if(CPU_RESETSW) begin
                encoded <= 0;
                input_index <= 0;
                user_input <= 0;
                LED <= 16'h00FF;
                pwd <= 16'h1234;
        end  
        
        if(pressed != 4'b0000) begin //FIXME
            //Store User input

            case(pressed)
                4'b0001: user_input[input_index] = 4'h1; //Up
                4'b0010: user_input[input_index] = 4'h2; //Right
                4'b0100: user_input[input_index] = 4'h3; //Down
                4'b1000: user_input[input_index] = 4'h4; //Left
            endcase
            encoded[0] <= user_input[3];
            encoded[1] <= user_input[2];
            encoded[2] <= user_input[1];
            encoded[3] <= user_input[0];
            input_index <= input_index + 1;
            //update seven segment
            
            
            //check unlock
            if(input_index == 3) begin
            $display(user_input);
            $display(pwd);
                if(user_input == pwd) begin
                    LED <= '1;
                end else begin
                    LED <= '0;
                end
            end
        end 
     end

endmodule