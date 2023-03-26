verilator -sv -cc --build ../src/singlebit.sv ../src/multibit.sv top.sv --top top --exe tb_top.cpp
verilator -sv -cc --build ../src/singlebit.sv ../src/multibit.sv top.sv --top top +define+MULTI --exe tb_top.cpp
