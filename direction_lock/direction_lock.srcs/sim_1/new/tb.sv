`timescale 1ns/ 100ps;

module tb;

  logic                    clk; 
  logic                    CPU_RESETSW;
  logic [3:0]              BUTTONS;
  logic [15:0]             LED;
  logic [3:0]              anode; // 7 segment display ports
  logic [7:0]              cathode;
  logic [3:0][3:0]         encoded; //Hex values for all 4 segments. 0011 1010 0101 0001
  logic [1:0]              input_index;

  direction_lock u_direction_lock (.*);
  
  initial begin
        clk = 0; // Initialize clock signal
        forever #5 clk = ~clk; // Toggle clock every 5 time units (e.g., 10ns period for 100MHz clock)
    end

  // Stimulus
  initial begin
    $printtimescale(tb);
    CPU_RESETSW <= 0;
    $display("TEST: Password - Incorrect");
    
    BUTTONS <= 4'h3;
    #50 
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h4;
    #50
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h2;
    #50 
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h1;
    #50
    BUTTONS <= 4'h0;
    #50
    
    if(LED == '0) begin
        $display("PASS: Incorrect input denied");
    end else begin 
        $display("FAIL: Incorrect input allowed");
    end
    
    CPU_RESETSW <= 1;
    #100
    CPU_RESETSW <= 0;
    #100
    
    
    $display("TEST: Password - Correct");
    BUTTONS <= 4'h1;
    #50 
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h2;
    #50
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h3;
    #50 
    BUTTONS <= 4'h0;
    #50
    BUTTONS <= 4'h4;
    #50
    BUTTONS <= 4'h0;
    #50
    if(LED == '1) begin
        $display("PASS: Correct input allowed");
    end else begin 
        $display("FAIL: Correct input denied");
    end
    
    
    $stop;
  end

  // Checking

endmodule // tb
