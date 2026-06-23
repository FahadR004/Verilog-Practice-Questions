module testbench;
 
reg a, b, cin;
wire sum, cout;
 
full_adder dut(
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
  .cout(cout)
);
 
initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1, testbench);
     cin= 1'b0; a = 1'b0; b=1'b0; #10;
     cin= 1'b0; a = 1'b0; b=1'b1; #10;
  cin= 1'b0; a = 1'b1; b=1'b0; #10;
     cin= 1'b0; a = 1'b1; b=1'b1; #10;
     cin= 1'b1; a = 1'b0; b=1'b0; #10;
     cin= 1'b1; a = 1'b0; b=1'b1; #10;
     cin= 1'b1; a = 1'b1; b=1'b0; #10;
     cin= 1'b1; a = 1'b1; b=1'b1; #10;
   end
 
endmodule
