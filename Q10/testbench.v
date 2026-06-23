// Code your testbench here
// or browse Examples
module testbench; 

reg clk, rst, direction;
  wire [3:0] count;
  
up_down_counter dut(
  .clk(clk),
  .rst(rst),
  .direction(direction),
  .count(count)
);

initial 
    begin
        clk = 1'b1;
        forever #5 clk = ~clk;        
    end 

initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1, testbench);
    // Reset
    rst = 1; direction = 1;
    repeat(2) @(posedge clk); #1;
    // Thus, this means we wait for two positive edges of the clock and then 1 time unit delay after the second edge before changing signals.
    // clk: _|‾‾‾|___|‾‾‾|___
    //  @posedge  @posedge
    //       +#1       +#1  ← you change signals here, safely after the edge
    // Count up
    rst = 0; direction = 1;
    repeat(5) @(posedge clk); #1;
    // Now, we wait for positive edges of the clock again (+1 time unit) before changing our signals again. 

	// Count down
    direction = 0;
    repeat(5) @(posedge clk); #1;
    // Waitiing again for five clock edges 
    
    // Reset last time
    rst = 1; 
    @(posedge clk); #1;
    $finish;
end
    
endmodule         ↑         ↑
