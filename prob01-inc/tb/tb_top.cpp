#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <cstdlib>
#include <string>
#include <iostream>
#include <verilated.h>
#include <verilated_fst_c.h>
#include "Vtop.h"

#define MAX_SIM       15
vluint64_t sim_unit = 0;
vluint64_t sim_time = 0;
vluint8_t p_data_i;
vluint8_t p_rst_ni;
vluint8_t x_incr_o;

void dut_clock(Vtop *dut, VerilatedFstC *vtrace);
void drv_in(Vtop *dut, vluint64_t sim_unit);
void mnt_out(Vtop *dut, VerilatedFstC *vtrace);
void mnt_proc(Vtop *dut);
void ppassed(Vtop *dut);
void pfailed(Vtop *dut, VerilatedFstC *vtrace);

void ppassed(Vtop *dut) {
  printf("@%3d::PASSED:: Ouput %x | Exp. %x | Input %x\n", sim_time, dut->incr_o, x_incr_o, dut->data_i);
}

void pfailed(Vtop *dut, VerilatedFstC *vtrace) {
  printf("@%3d::FAILED:: Ouput %x | Exp. %x | Input %x\n", sim_time, dut->incr_o, x_incr_o, dut->data_i);
  vtrace->close();
  delete dut;
  exit(EXIT_FAILURE);
}

void drv_in(Vtop *dut, vluint64_t sim_unit) {
  dut->rst_ni = (sim_unit > 4) && (rand()%30 != 0);
  dut->data_i = rand()%16;
  dut->eval();
}

void dut_clock(Vtop *dut, VerilatedFstC *vtrace) {
  sim_time = sim_time + 5;
  dut->clk_i = 0; dut->eval();
  if (vtrace) vtrace->dump(sim_time); // Dump values after negedge

  mnt_out(dut, vtrace);        // Values are "stable" to monitor

  sim_time = sim_time + 5;
  dut->clk_i = 1; dut->eval();

  drv_in(dut, sim_unit);

  if (vtrace) {
    vtrace->dump(sim_time); // Dump values after posedge
    //vtrace->flush();
  }
}

void mnt_proc(Vtop *dut) {
  if (!p_rst_ni)
    x_incr_o = 0;
  else
    x_incr_o = (p_data_i + 1)%16;

  p_data_i = dut->data_i;
  p_rst_ni = dut->rst_ni;
}

void mnt_out(Vtop *dut, VerilatedFstC *vtrace) {
  if (dut->incr_o == x_incr_o)
    ppassed(dut);
  else
    pfailed(dut, vtrace);
}

int main(int argc, char **argv, char **env) {
	// Call commandArgs first!
	Verilated::commandArgs(argc, argv);

  // Instantiate the design
	Vtop *dut = new Vtop;

  // Trace generating
  Verilated::traceEverOn(true);
  VerilatedFstC *vtrace = new VerilatedFstC;
  dut->trace(vtrace, 2); // trace down to 2 hierarchy
  vtrace->open("wave.fst");
  vtrace->dump(0);

  // Initial setups
  srand(time(NULL));
  dut->eval();

  // Check procedure
  while (sim_unit < MAX_SIM){
    dut_clock(dut, vtrace);
    mnt_proc(dut);
    sim_unit++;
	}

  vtrace->close();
  delete dut;
  exit(EXIT_SUCCESS);
}
