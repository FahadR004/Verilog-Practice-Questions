module mux_2to1(
  input a, b, sel,
  output x
);
 
assign x = sel ? b : a;
  
endmodule