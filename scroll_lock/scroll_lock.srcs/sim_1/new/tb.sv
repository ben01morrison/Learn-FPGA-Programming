`timescale 1ns / 100ps

module tb;

    logic                    clk; 
    logic                    CPU_RESETSW;
    logic [3:0]              BUTTONS;
    logic                    CENTER_BUTTON;
    logic [15:0]             LED;
    logic [3:0]              anode; // 7 segment display ports
    logic [7:0]              cathode;
    logic [1:0]              input_index;
    logic [3:0][3:0]         encoded; // Hex values for all 4 segments. 0011 1010 0101 0001
    logic [3:0]              pressed;
    logic [3:0][3:0]         user_input; 
    logic [3:0][3:0]         pwd; 

    scroll_lock #(.CTR_BITS (3)) u_scroll_lock (.*);

    initial begin
        clk = 0; // Initialize clock signal
        forever #5 clk = ~clk; // Toggle clock every 5 time units (e.g., 10ns period for 100MHz clock)
    end

    // Stimulus
    initial begin
        $display("STARTING");
        $printtimescale(tb);
        CPU_RESETSW <= 0;
        BUTTONS <= 4'h0;
        CENTER_BUTTON <= '0;

        $display("TEST CASE 1:");
        press_buttons(4'b0001, 300); //+
        press_buttons(4'b0100, 300); // left
        press_buttons(4'b0001, 300); // +
        press_buttons(4'b0001, 300);
        press_buttons(4'b0001, 300);
        press_buttons(4'b0001, 300);
        press_buttons(4'b0001, 300);
        press_buttons(4'b0001, 300);
        press_buttons(4'b1000, 300); // -
        press_buttons(4'b0100, 300); // left
        press_buttons(4'b0001, 300); // + 
        press_buttons(4'b0001, 300); 
        press_buttons(4'b0100, 300); // left
        press_buttons(4'b0001, 300); // + 
        press_buttons(4'b0100, 300); // left
        press_buttons(4'b0010, 300); // right
        press_buttons(4'b1000, 300); // -
        press_buttons(4'b1000, 300); 
        press_buttons(4'b1000, 300); 
        press_buttons(4'b1000, 300); 
        
        CENTER_BUTTON <= '1;
        # 500
        CENTER_BUTTON <= '0;
        # 500
        
        
        
        $stop;
    end

    task press_buttons;
        input [3:0] button_value;
        input [31:0] time_unit;
        begin
            BUTTONS <= '0;
            #(time_unit >> 2); // 1/4 time
            BUTTONS <= button_value;
            #(time_unit >> 1); // 1/2 time
            BUTTONS <= '0;
            #(time_unit >> 2); // 1/4 time
        end
    endtask

endmodule // tb
