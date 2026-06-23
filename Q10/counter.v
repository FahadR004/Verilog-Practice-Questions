// Code your design here
module up_down_counter (
    input clk, rst, direction,
    output reg [3:0] count
);

always @(posedge clk) 
    begin
//         if (direction)
//             begin
//                 if (rst)
//                     count <= 4'b0000;
//                 else 
//                     count <= count + 1; 
//             end        
//         else 
//             begin 
//                 if (rst)
//                     count <= 4'b1111;
//                 else
//                     count <= count - 1;
//             end
      if (rst)         count <= 0;          
	  else if (direction) count <= count+1;
	  else                count <= count-1;
    end 
endmodule