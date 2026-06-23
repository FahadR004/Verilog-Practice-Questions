module testbench;
 
reg a, b, sel;
wire x;
 
mux_2to1 dut(
    .a(a),
    .b(b),
    .sel(sel),
    .x(x)
);
 
initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1, testbench);
     a = 1'b0; b=1'b1; sel=1'b0;  #10;
     a = 1'b1; b=1'b0; sel=1'b0;  #10;
     a = 1'b1; b=1'b0; sel=1'b1;  #10;
     a = 1'b0; b=1'b1; sel=1'b1;  #10;

   end
endmodule
