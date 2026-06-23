module d_ffp_reset_async (
  input clk, d, rst, 
  output reg q
);
  
  always @(posedge clk or pos rst)
    begin
      if (rst)
        q <= 1'b0;
      else
     	q <= d;
    end
endmodule

