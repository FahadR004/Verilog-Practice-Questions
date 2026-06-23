module testbench;
reg clk, d, rst;
wire q;  
d_ffp_reset_async dut(
    .clk(clk),
  	.rst(rst),
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
    d = 1'b0; rst = 1'b1; #15; 
    d = 1'b0; rst = 1'b0; #15; 
    d = 1'b1;             #12; 
    rst = 1'b1;           #18; 
    $finish;
  end
  endmodule