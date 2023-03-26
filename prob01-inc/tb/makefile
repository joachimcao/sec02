FILES := ../src/incr.sv

VER       = verilator
VER_FLAGS += -sv -cc
VER_FLAGS += --build
VER_FLAGS += -Wall
VER_FLAGS += --assert
VER_FLAGS += --trace-fst

LINT_FLAGS = -Wall --lint-only -sv

# Input files for Verilator
VER_INPUT = $(FILES) top.sv --top-module top

.PHONY: lint
lint:
	@echo "::LINT CHECK::"
	@$(VER) $(LINT_FLAGS) $(FILES)

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
