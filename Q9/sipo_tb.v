// Code your testbench here
// or browse Examples
module sipo_tb;
reg clk, rst;
reg serial_in;
wire [3:0] parallel_out;
sipo_reg dut(
    .clk(clk),
    .rst(rst),
    .serial_in(serial_in),
    .parallel_out(parallel_out)
);
initial begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, sipo_tb);
    rst = 1'b1; serial_in = 1'b0;
    repeat(2) @(posedge clk); #1;
    rst = 1'b0; serial_in = 1'b1;
    repeat(5) @(posedge clk); #1;
    rst = 1'b1;
    repeat(3) @(posedge clk); #1;
    $finish;
end
endmodule