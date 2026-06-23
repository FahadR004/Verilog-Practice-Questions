// Code your testbench here
// or browse Examples

module siso_tb;
reg clk, rst;
reg serial_in;
wire serial_out;
siso dut(
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .serial_out(serial_out)
);
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, siso_tb);
   
  	rst = 1'b1; serial_in = 1'b0;
    repeat(2) @(posedge clk); #1;
    
    rst = 1'b0; serial_in = 1'b1;
    repeat(2) @(posedge clk); #1;
    
    serial_in = 1'b0;
    repeat (5) @(posedge clk); #1;
    
    rst = 1'b1;
    repeat(4) @(posedge clk); #1;
    $finish;
end
endmodule