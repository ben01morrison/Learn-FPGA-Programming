
`timescale 1ns / 1ps

module scroll_lock
    #
    (
    parameter NUM_SEGMENTS = 4,
    parameter CLK_PER      = 10,  // Clock period in ns
    parameter REFR_RATE    = 1000, // Refresh rate in Hz
    parameter CTR_BITS     = 9
    )
    (
    input wire                        clk,
    input wire                        CPU_RESETSW, //RESET SW
    input wire [3:0]                  BUTTONS,
    input wire                        CENTER_BUTTON,
    output logic [15:0]               LED,
    output logic [NUM_SEGMENTS-1:0]   anode, // 7 segment display ports
    output logic [7:0]                cathode
//    output logic [1:0]                         input_index, //REMOVE FOR IMPLAMENTATION
//    output logic [NUM_SEGMENTS-1:0][3:0]       encoded, // RM
//    output logic [3:0]                         pressed, //RM
//    output logic [3:0][3:0]                    user_input, //RM
//    output logic [3:0][3:0]                    pwd //RM
    ); 



    //7 Segment Setup

    logic [NUM_SEGMENTS-1:0]            digit_point;
    logic                               enter;
    
    logic [1:0]                         input_index;
    logic [NUM_SEGMENTS-1:0][3:0]       encoded;
    logic [3:0]                         pressed;
    logic [3:0][3:0]                    user_input; 
    logic [3:0][3:0]                    pwd; 
    

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
        //.POS_EDGE (1),
        .CTR_BITS (CTR_BITS)
     )
     button[4]
     (
        .button_in (BUTTONS),
        .clk       (clk),
        .pressed   (pressed)
     );
     
     debouncer
     #
     (
        //.POS_EDGE (1),
        .CTR_BITS (CTR_BITS)
     )
     center_button
     (
        .button_in (CENTER_BUTTON),
        .clk       (clk),
        .pressed   (enter)
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
        
        //update seven segment
        encoded[0] <= user_input[3];
        encoded[1] <= user_input[2];
        encoded[2] <= user_input[1];
        encoded[3] <= user_input[0];
        
        
        if(CPU_RESETSW) begin // Reset function
        
                encoded <= 0;
                input_index <= 0;
                user_input <= 0;
                LED <= 16'h00FF;
                pwd <= 16'h1234;
                
        end else if(pressed != 4'b0000) begin //User input handling
            //Store User input
                case(pressed)
                    4'b0001: user_input[input_index] = user_input[input_index] + 1; //Up
                    4'b0010: input_index = input_index - 1; //Left
                    4'b0100: input_index = input_index + 1; //Right
                    4'b1000: user_input[input_index] = user_input[input_index] - 1; //Down
                endcase
                
        end else if (enter) begin // PWD Check
        
            $display(user_input);
            $display(pwd);
            if(user_input == pwd) begin
                LED <= '1;
            end else begin
                LED <= '0;
            end
            
        end
        
        case (input_index) 
            2'b00: digit_point <= 4'b0111;
            2'b01: digit_point <= 4'b1011;
            2'b10: digit_point <= 4'b1101;
            2'b11: digit_point <= 4'b1110;
        endcase
        
     end

endmodule