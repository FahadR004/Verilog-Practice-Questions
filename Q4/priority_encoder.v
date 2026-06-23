module priority_encoder(
  input [3:0] data,
  output reg a,b
);
always @(*)
begin
      if (data[3])
        begin
            a = 1'b1;
      b = 1'b1;
        end
      else if (data[2])
        begin
            a = 1'b1;
      b = 1'b0;
        end
      else if (data[1])
        begin
            a = 1'b0;
      b = 1'b1;
        end
      else
        begin
            a = 1'b0;
      b = 1'b0;
        end
    end
endmodule