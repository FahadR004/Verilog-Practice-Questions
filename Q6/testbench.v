// Code your testbench here
// or browse Examples
module testbench;
reg clk, d;
wire q;  
d_ffp dut(
    .clk(clk),
    .d(d),
    .q(q)
);
initial 
  begin
  	clk = 1'b0;
    forever #5 clk = ~clk;
  end
initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1, testbench);
    d = 1'b0; #10;
    d = 1'b1; #10;
    d = 1'b0; #10;
    $finish;
  end
  endmodule