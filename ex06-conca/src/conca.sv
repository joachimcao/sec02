module conca (
  // input

  // output

);

  logic [ 3:0] a;
  logic [ 3:0] b;
  logic [ 3:0] c;
  logic [ 7:0] d;
  logic [11:0] e;
  initial begin
    // Basic concatenation
    a = 4'h1;  $display("a = %x", a);
    b = 4'h2;  $display("b = %x", b);
    c = 4'h3;  $display("c = %x", c);
    d = 8'h45; $display("d = %x", d);

    e = {a, b, c};    $display("a-b-c        = %x", e);
    e = {b, a, c};    $display("b-a-c        = %x", e);
    e = {c, b, a};    $display("c-b-a        = %x", e);

    e = {a, d};       $display("a-d          = %x", e);
    e = {d, a};       $display("d-a          = %x", e);

    e = {a, 8'hf0};   $display("a-8'hf0      = %x", e);
    e = {8'hf0, a};   $display("8'hf0-a      = %x", e);

    // Repeat operator
    e = {3{a}};       $display("  3a = a-a-a = %x", e);
    e = {a, {2{c}}};  $display("a-2c = a-c-c = %x", e);
  end

endmodule : conca
