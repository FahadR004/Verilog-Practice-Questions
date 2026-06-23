module piso_reg(
    input clk, shift_load, rst,
    input [3:0] parallel_in,
    output reg serial_out
)

// shift_load = 0 -> Load parallel input
// shift_load = 1 -> Give serial output

reg [3:0] q; // internal register

always @(posedge clk)
    begin
        if (rst)
            q <= 4'b0;
        else if (!shift_load)
            q <= parallel_in;
        else
            begin
                serial_out <= q[0];
                q <= q >> 1;
            end
    end