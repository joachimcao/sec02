module incr (
  input  wire  [3:0] data_i,

  output reg   [3:0] incr_o,

  input  wire         clk_i,
  input  wire        rst_ni
);

  // Local declaration
  wire [3:0] incr_d;
  reg  [3:0] incr_q;

  // Combinational logic
  always @(*)
    incr_d = data_i + 4'h1;
  end

  // Sequential logic
  always @(posedge clk_i)
    if (!rst_ni) begin
      incr_q <= '0;
    end
    else begin
      incr_q <= incr_d;
    end
  end

  // Connect output
  assign incr_o = incr_q;

endmodule
