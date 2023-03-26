module stru ();

  typedef struct packed {
    logic [3:0] x;
    logic [3:0] y;
    logic [3:0] z;
  } point_t;

  point_t point_a;
  point_t point_b;

  // Declare other variables using $bits()
  logic [$bits(point_t)-1:0] point_bit;

  initial begin
    // Reading and writing fields
    $display("Reading and Writing fields");
    point_a.x = 4'h3;
    point_a.y = 4'h4;
    point_a.z = 4'h5;
    $display("point_a.x = %x", point_a.x);
    $display("point_a.y = %x", point_a.y);
    $display("point_a.z = %x", point_a.z);

    // Assign structs
    $display("\nAssign A to B");
    point_b = point_a;
    $display("point_b.x = %x", point_b.x);
    $display("point_b.y = %x", point_b.y);
    $display("point_b.z = %x", point_b.z);

    // Assign structs to bit vector
    $display("\nAssign to vector");
    point_bit = point_a;
    $display("point_bit = %x", point_bit);

    // Assign bit vector to struct
    $display("\nAssign to struct");
    point_bit = { 4'd2, 4'd0, 4'd3 };
    $display("point_bit = %x", point_bit);
    point_a = point_bit;
    $display("point_a.x = %x", point_a.x);
    $display("point_a.y = %x", point_a.y);
    $display("point_a.z = %x", point_a.z);
  end

endmodule : stru
