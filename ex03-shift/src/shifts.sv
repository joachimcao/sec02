module shifts (
  // input

  // output

);

  // Multi-bit declaration
  logic [11:0] a;
  logic [11:0] b;
  logic [11:0] c;
  logic [ 3:0] d;

  initial begin
    a = 12'b0101_1101_0011; $display("a = 12'b0101_1101_0011 = %b", a);
    b = 12'b1101_1111_0011; $display("b = 12'b1101_1111_0011 = %b", b);
    d =  4'd4;              $display("d = %b", d);

    // Fixed amount shifts
    $display("\nFixed amount shifts");
    c = a << 1; $display("a << 1 = %b", c);
    c = a << 2; $display("a << 2 = %b", c);
    c = a << 4; $display("a << 4 = %b", c);

    c = a >> 1; $display("a >> 1 = %b", c);
    c = a >> 2; $display("a >> 2 = %b", c);
    c = a >> 4; $display("a >> 4 = %b", c);

    // Variable
    $display("\nVariable amount shifts");
    c = a << d; $display("a << d = %b", c);
    c = a >> d; $display("a >> d = %b", c);

    // Arithmetic shift
    $display("\nArithmetic shift");
    c =         b  >>> d; $display("b >>> d = %b", c);
    c = $signed(b) >>> d; $display("b >>> d = %b *signed", c);
  end

endmodule : shifts
