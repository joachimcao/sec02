module relat (
  // input

  // output

);

  logic [3:0] a;
  logic [3:0] b;
  logic       c;

  initial begin
    a = 4'd5; $display("a = %d", a);
    b = 4'd9; $display("b = %d", b);

    //
    c = (a == b); $display("a == b: %b", c);
    c = (a != b); $display("a != b: %b", c);
    c = (a >  b); $display("a >  b: %b", c);
    c = (a >= b); $display("a >= b: %b", c);
    c = (a <  b); $display("a <  b: %b", c);
    c = (a <= b); $display("a <= b: %b", c);

    //
    $display("\nSigned vs Unsigned");
    a = 4'd5; $display("a = %b", a);
    b = 4'd9; $display("b = %b", b);
    c = (        a   >         b ); $display("a > b: %b", c);
    c = (        a   <         b ); $display("a < b: %b", c);
    c = ($signed(a)  > $signed(b)); $display("a > b: %b *signed", c);
    c = ($signed(a)  < $signed(b)); $display("a < b: %b *signed", c);
  end

endmodule : relat
