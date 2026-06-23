module pipo_tb;
reg clk, rst;
reg [3:0] parallel_in;
wire [3:0] parallel_out;
pipo uut(
    .rst (rst),
    .clk (clk),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
);
// localparam CLK_PERIOD = 10;
// always #(CLK_PERIOD/2) clk=~clk;
initial 
    begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, pipo_tb);
    rst = 1'b1; 
    repeat(2) @(posedge clk); #1;

    rst = 1'b0; parallel_in = 4'b1010;
    repeat(2) @(posedge clk); #1;

    parallel_in = 4'b1011;
    repeat(2) @(posedge clk); #1;

    parallel_in = 4'b1111;
    repeat(2) @(posedge clk); #1;

    rst = 1'b0;
    @(posedge clk); #1;

    $finish;
end
endmodule
