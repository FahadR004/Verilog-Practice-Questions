
module jk_flipflop_tb;
  reg  clk, rst_n, j, k;
  wire q, q_bar;
  jk_flipflop uut (
    .clk   (clk),
    .rst_n (rst_n),
    .j(j),
    .k(k),
    .q(q),
    .q_bar (q_bar)
  );

  initial 
    begin
      clk = 0;
      forever #5 clk = ~clk;
    end
    initial 
      begin
        $dumpfile("jk_flipflop.vcd");
        $dumpvars(0, jk_flipflop_tb);
        // --- 1. Apply synchronous reset ---
        rst_n = 0; j = 0; k = 0;
        @(posedge clk); #1;
        @(posedge clk); #1;
        // Release reset
        rst_n = 1;
        // --- 2. Hold (J=0, K=0) ---
        j = 0; k = 0;
        @(posedge clk); #1;
        @(posedge clk); #1;
        // --- 3. Set (J=1, K=0) ---
        j = 1; k = 0;
        @(posedge clk); #1;
        // --- 4. Hold again after Set ---
        j = 0; k = 0;
        @(posedge clk); #1;
        // --- 5. Reset (J=0, K=1) ---
        j = 0; k = 1;
        @(posedge clk); #1;
        // --- 6. Toggle (J=1, K=1) x4 ---
        j = 1; k = 1;
        @(posedge clk); #1;
        @(posedge clk); #1;
        @(posedge clk); #1;
        @(posedge clk); #1;
        // --- 7. Set then immediate reset ---
        j = 1; k = 0;
        @(posedge clk); #1;
        j = 0; k = 1;
        @(posedge clk); #1;
        // --- 8. Toggle from 0 ---
        j = 1; k = 1;
        @(posedge clk); #1;
        $finish;
    end
 
endmodule
 
