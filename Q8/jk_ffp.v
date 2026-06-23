// Code your design here
module jk_flipflop (
    input  wire clk,    // Clock (rising-edge triggered)
    input  wire rst_n,  // Active-low synchronous reset
    input  wire j,      // J input
    input  wire k,      // K input
    output reg  q,      // Output Q
    output wire q_bar   // Complement output
);
assign q_bar = ~q;

  always @(posedge clk) begin
    if (!rst_n)
      q <= 1'b0;          // Synchronous reset
    else begin
      case ({j, k})
        2'b00: q <= q;          // Hold
        2'b01: q <= 1'b0;       // Reset
        2'b10: q <= 1'b1;       // Set
        2'b11: q <= ~q;         // Toggle
      endcase
    end
  end

endmodule