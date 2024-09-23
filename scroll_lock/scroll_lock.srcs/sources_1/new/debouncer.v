`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/27/2024 02:24:26 PM
// Design Name: 
// Module Name: debouncer
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


module debouncer
    #(
    parameter POS_EDGE = 1,
    parameter CTR_BITS = 8
    )
    (
    input button_in,
    output reg pressed,
    input clk
    );

    (* ASYNC_REG = "TRUE", mark_debug = "true" *) reg [2:0] button_sync; //Mark the input as Asynchronous for synthesis.
    (* mark_debug = "true" *) reg       counter_en; //mar_debug guarentees that the counter_en net will be synthesized
    (* mark_debug = "true" *) reg [CTR_BITS-1:0] counter = 'b0;    // available for debug even if it can be optimised out.

   
     always @(posedge clk) begin
        pressed <= 1'b0;
        button_sync <= button_sync << 1 | button_in; // shift the value left by 1 and add BTNC state to last bit. ex. 110 -> 10x where x is BTNC state.
        
        if (((button_sync[2:1] == 2'b01)&&(POS_EDGE))||((button_sync[2:1] == 2'b10)&&(!POS_EDGE))) begin
        counter_en <= 1'b1;
        //$display("edge detected");
        end // If an edge is detected. ex. 011 = _-- enable the counter
        
        else if (~button_sync[1])      counter_en <= 1'b0; // else if a 0 has been detected, dissable the counter.

        if (counter_en) begin
          //$display(counter);
          counter <= counter + 1'b1;
          if (&counter) begin // &counter means and all bitwise values of counter.
            counter_en <= 1'b0; // dissable counter
            counter    <= 1'b0; // reset counter
            pressed <= 1'b1; // button has been pressed
            //$display("Counter done");
          end
        end
      end
endmodule
