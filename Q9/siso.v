// Code your design here
module siso(
    input rst, clk,
    input serial_in,
    output reg serial_out
);

reg [3:0] q;

always @(posedge clk)
begin
    if (rst)
        begin
            q <= 4'b0000;
        end
    else
        begin
            q <= {serial_in, q[3:1]};    
        end
end

assign serial_out = q[0];
  
endmodule