module piso_tb;

reg clk, rst, shift_load;
reg [3:0] parallel_in;
wire serial_out;

piso_reg dut(
    .clk(clk),
    .rst(rst),
    .shift_load(shift_load),
    .parallel_in(parallel_in),
    .serial_out(serial_out)
);

initial 
    begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, piso_tb);
    rst = 1'b1; parallel_in = 4'b0000; shift_load = 1'b0;
    repeat(2) @(posedge clk); #1;

    rst = 1'b0; shift_load = 1'b0; parallel_in = 4'b1010;
    repeat(3) @(posedge clk); #1;

    shift_load = 1;
    repeat(5) @(posedge clk); #1;

    rst = 1'b0;
    repeat(2) @(posedge clk); #1;

    shift_load = 1;
    repeat(5) @(posedge clk); #1;
    
    $finish;
end

endmodule;