FILES := ../src/ter.sv

VER       = verilator
VER_FLAGS += -sv -cc
VER_FLAGS += --build

# Input files for Verilator
VER_INPUT = $(FILES) top.sv --top-module top

.PHONY: sim
sim: ./obj_dir/Vtop
./obj_dir/Vtop: $(FILES) top.sv
	@echo "::SIMULATING::"
	$(VER) $(VER_FLAGS) $(VER_INPUT) +define+$(define) --exe tb_top.cpp
	./obj_dir/Vtop

.PHONY: clean
clean:
	@rm -rf obj_dir
	@echo "::CLEAN::"
