module top #(
  parameter BValue = 6
)
(
  output logic [3:0] c
);

  logic [3:0] a;
  logic [3:0] b;

  assign a = 4'h7;
  assign b = BValue;

  arith dut (
    .a(a),
    .b(b),
    .c(c)
  );

endmodule : top
