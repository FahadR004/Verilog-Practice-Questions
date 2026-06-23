module alu(
  input [3:0] a,b,
  input [1:0] opcode,
  output reg [7:0] result
);
always @(*)
  case(opcode)
      2'b00: result = a + b;
      2'b01: result = a - b;
      2'b10: result = a * b;
      2'b11: result = (b == 4'b0000) ? (8'h00) : (a / b);
    default: result = 8'h00;
    endcase
endmodule