`timescale 1ns/10ps
module challenge
  (
   input  wire  [2:0]    SW,
   output logic [1:0]    LED
   );

  // SW[2] is carry in
  wire A, B, C;
  assign A = SW[1];
  assign B = SW[0];
  assign C = SW[2];
  // SW[1] is A
  // SW[0] is B
  assign LED[0]  = (~A&~B&C)|(~A&B&~C)|(A&~B&~C)|(A&B&C); // Write the code for the Sum
  assign LED[1]  = (~A&B&C)|(A&~B&C)|(A&B&~C)|(A&B&C); // Write the code for the Carry
endmodule // challenge
