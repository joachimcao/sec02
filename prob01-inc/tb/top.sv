module top #()
(
  input  logic [3:0] data_i,

  output logic [3:0] incr_o,

  input  logic        clk_i,
  input  logic       rst_ni
);

  incr dut (
    .*
  );

endmodule : top
