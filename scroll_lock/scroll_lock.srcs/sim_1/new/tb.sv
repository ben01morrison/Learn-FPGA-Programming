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
  logic [3:0]              pressed;
  logic [3:0][3:0]                    user_input; 
  logic [3:0][3:0]                    pwd; 

  scroll_lock u_scroll_lock (.*);
  
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
    
    $display("TEST CASE: Password - Incorrect");
    #500
    BUTTONS <= 4'b0100;
    #500 
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b1000;
    #500
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b0010;
    #500
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b0001;
    #500
    BUTTONS <= 4'h0;
    #500
    
    if(LED == '0) begin
        $display("PASS: Incorrect input denied");
    end else begin 
        $display("FAIL: Incorrect input allowed");
    end
    
    
    
    CPU_RESETSW <= 1;
    #100
    CPU_RESETSW <= 0;
    #100
    
    
    $display("TEST CASE: Password - Correct");
    BUTTONS <= 4'b0001;
    #500 
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b0010;
    #500
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b0100;
    #500
    BUTTONS <= 4'h0;
    #500
    BUTTONS <= 4'b1000;
    #500
    BUTTONS <= 4'h0;
    #500
    if(LED == '1) begin
        $display("PASS: Correct input allowed");
    end else begin 
        $display("FAIL: Correct input denied");
    end
    
    
    $stop;
  end

  // Checking

endmodule // tb
