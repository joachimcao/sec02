#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cstdlib>
#include <string>
#include <iostream>
#include <verilated.h>
#include <verilated_fst_c.h>
#include "Vtop.h"

int main(int argc, char **argv, char **env) {
	// Call commandArgs first!
	Verilated::commandArgs(argc, argv);

  // Instantiate the design
	Vtop *dut = new Vtop;

  // Initial setups
  srand(time(NULL));
  dut->eval();

  delete dut;
  exit(EXIT_SUCCESS);
}
