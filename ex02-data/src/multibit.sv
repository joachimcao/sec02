module multibit (
  // input

  // output

);

  // Multi-bit declaration
  logic [ 3:0] a;
  logic [ 3:0] b;
  logic [ 3:0] c;
  logic [11:0] d;
  logic        e;

  initial begin
    // Multi-bit literals or assign values
    $display("\nMulti-bit literals");
    d = 12'b0101_1101_0010; $display("d = 12'b0101_1101_0010 = %b", d);
    d = 12'b0101_1101_0010; $display("d = 12'b0101_1101_0010 = %x", d);
    d = 12'h5fa; $display("d = 12'h5fa = %x", d);
    d = 12'd377; $display("d = 12'd377 = %x", d);

    a = 4'b0110; $display("a = 4'b0110 = %b", a);
    b = 4'b1101; $display("b = 4'b1101 = %x", b);

    // Bitwise logical operators
    $display("\nBitwise logical operators");
    c = a  & b; $display("a  AND b = %b", c);
    c = a  | b; $display("a   OR b = %b", c);
    c = a  ^ b; $display("a  XOR b = %b", c);
    c = a ~^ b; $display("a XNOR b = %b", c);
    c =     ~b; $display("   NOT b = %b", c);

    // Reduction operators
    $display("\nReduction operators");
    e =  &a; $display(" AND all bit of a = %b", e);
    e = ~&a; $display("NAND all bit of a = %b", e);
    e =  |a; $display("  OR all bit of a = %b", e);
    e = ~|a; $display(" NOR all bit of a = %b", e);
    e =  ^a; $display(" XOR all bit of a = %b", e);
    e = ~^a; $display("NXOR all bit of a = %b", e);
  end

endmodule : multibit
