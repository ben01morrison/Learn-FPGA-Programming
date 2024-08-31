`timescale 1ns/10ps
module seven_segment
  #
  (
   parameter NUM_SEGMENTS = 8,
   parameter CLK_PER      = 10,  // Clock period in ns
   parameter REFR_RATE    = 1000 // Refresh rate in Hz
   )
  (
   input wire                         clk,
   input wire [NUM_SEGMENTS-1:0][3:0] encoded,
   input wire [NUM_SEGMENTS-1:0]      digit_point,
   output logic [NUM_SEGMENTS-1:0]    anode,
   output logic [7:0]                 cathode
   );

  localparam INTERVAL = int'(100000000 / (CLK_PER * REFR_RATE));

  logic [$clog2(INTERVAL)-1:0]        refresh_count; //takes the log2 of the Interval to determine how many bits are needed.
  logic [$clog2(NUM_SEGMENTS)-1:0]    anode_count;
  logic [NUM_SEGMENTS-1:0][7:0]       segments;

  cathode_top ct[NUM_SEGMENTS] 
    (
     .clk        (clk),
     .encoded    (encoded),
     .digit_point(digit_point),
     .cathode    (segments) // verilog can slice the original [4][8] segments array into one 8 bit array for each cathode_top instance.
     );  

  initial begin
    refresh_count = '0;
    anode_count   = '0;
  end

  //NOTE: Individual segments share a common anode.
  always @(posedge clk) begin
    if (refresh_count == INTERVAL) begin // if refresh count reached
      refresh_count <= '0; // reset counter
      anode_count   <= anode_count + 1'b1; // incrament anode. THis will roll over naturally if it reaches the max.
    end else refresh_count <= refresh_count + 1'b1; // else incrament the refresh count
    anode              <= '1; // set all of the anodes high.
    anode[anode_count] <= '0; // set selected anode low. Even though these are both non blocking, the last assignment overwrites the first.
    cathode            <= segments[anode_count]; // grabs the cathode assignments for the current segment
  end

endmodule
