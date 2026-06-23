// Code your design here
module d_ffp(
  input clk, d,
  output reg q
);
  
  always @(posedge clk)
    begin
      q <= d;
    end
endmodule

