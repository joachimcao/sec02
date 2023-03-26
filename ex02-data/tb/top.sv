module top #(
)
(

);


`ifndef MULTI
  singlebit dut ();
`else
  multibit dut ();
`endif

endmodule : top
