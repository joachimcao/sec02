module singlebit (
  // input

  // output

);

  // Local declaration
  logic a;
  logic b;
  logic c;

  initial begin
    // Single bit literals or assign values
    $display("\nSingle bit literals");
    a = 1'b0; $display("a = %b", a);
    b = 1'b1; $display("b = %b", b);

    // Bitwise logical operators
    $display("\nBitwise logical operators");
    c = a  & b; $display("a  AND b = %b", c);
    c = a  | b; $display("a   OR b = %b", c);
    c = a  ^ b; $display("a  XOR b = %b", c);
    c = a ~^ b; $display("a XNOR b = %b", c);
    c =     ~b; $display("   NOT b = %b", c);

    // Boolean logical operators
    $display("\nBoolean logical operators");
    c = a && b; $display("a  AND b = %b", c);
    c = a || b; $display("a   OR b = %b", c);
    c =     !b; $display("   NOT b = %b", c);
  end

endmodule : singlebit
