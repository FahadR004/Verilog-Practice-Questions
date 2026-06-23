module testbench;
 
reg [3:0] data;
wire a,b;
 
priority_encoder dut(
    .data(data),
    .a(a),
    .b(b)
);
 
initial
   begin
     $dumpfile("dump.vcd");
     $dumpvars(1, testbench);
     data=4'b1000;  #10;
     data=4'b0100;  #10;
     data=4'b0010;  #10;
     data=4'b0001;  #10;    
     data=4'b1100;  #10;
   end
endmodule
