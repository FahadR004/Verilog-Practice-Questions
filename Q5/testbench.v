module testbench;
 
  reg [3:0] a,b;
  reg [1:0] opcode;
  wire [7:0] result;
 
alu dut(
    .a(a),
    .b(b),
    .opcode(opcode),
    .result(result)
);
 
initial
begin
  $dumpfile("dump.vcd");
  $dumpvars(1, testbench);
  a = 4'b0001; b = 4'b1100; opcode = 2'b00; #10;
  a = 4'b0001; b = 4'b1100; opcode = 2'b01; #10;
  a = 4'b0001; b = 4'b1100; opcode = 2'b10; #10;
  a = 4'b0001; b = 4'b1100; opcode = 2'b11; #10;
  $finish;
end
 
endmodule
