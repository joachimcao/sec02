module incr (
  input  logic [3:0] data_i,

  output logic [3:0] incr_o,

  input  logic        clk_i,
  input  logic       rst_ni
);

  // Local declaration
  logic [3:0] incr_d;
  logic [3:0] incr_q;

  // Combinational logic
  always_comb begin : proc_comb
    incr_d = data_i + 4'h1;
  end

  // Sequential logic
  always_ff @(posedge clk_i) begin : proc_ff
    if (!rst_ni) begin
      incr_q <= '0;
    end
    else begin
      incr_q <= incr_d;
    end
  end

  // Connect output
  assign incr_o = incr_q;

endmodule : incr
