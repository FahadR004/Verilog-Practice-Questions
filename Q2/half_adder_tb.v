module testbench;
 
reg a, b;
wire sum, carry;
 
half_adder dut(
    .a(a),
    .b(b),
  .sum(sum),
   .carry(carry)
);
 
initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1, testbench);
     a = 1'b0; b=1'b0; #10;
     a = 1'b0; b=1'b1; #10;
     a = 1'b1; b=1'b0; #10;
     a = 1'b1; b=1'b1; #10;
   end
 
endmodule
