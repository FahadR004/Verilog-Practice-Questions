module testbench;
 
reg a, b;
wire x;
 
AND dut(
    .a(a),
    .b(b),
    .x(x)
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
