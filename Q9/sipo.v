// Code your design here
module sipo_reg (
    input clk, rst,
    input serial_in,
    output reg [3:0] parallel_out
);

reg [3:0] q; // internal register

always @(posedge clk)
    begin
        if (rst)
            q <= 4'b0;
        else 
          q <= {serial_in, q[3:1]};
    end

assign parallel_out = q;

endmodule

