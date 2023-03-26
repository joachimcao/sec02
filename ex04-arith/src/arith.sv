module arith (
  // input
  input  logic [3:0] a,
  input  logic [3:0] b,

  // output
  output logic [3:0] c

);

  initial begin
    $display("a = %b", a);
    $display("b = %b", b);

    c = a + b; $display("a + b = %b", c);
    c = a - b; $display("a - b = %b", c);
  end

endmodule : arith
