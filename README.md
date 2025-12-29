# ALU Verification IP (VIP) Project

## Overview
This project implements a Verification IP (VIP) for an Arithmetic Logic Unit (ALU) using SystemVerilog and the Universal Verification Methodology (UVM). The ALU design is based on the Verilog implementation provided by [FPGA4Student](https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html). The VIP is designed to verify the functionality of the ALU under various scenarios and ensure its correctness.

## ALU Functionality
The ALU performs the following operations based on a 4-bit selection input (`ALU_Sel`):

| `ALU_Sel` | Operation                     |
|-----------|-------------------------------|
| 0000      | Addition (`A + B`)           |
| 0001      | Subtraction (`A - B`)        |
| 0010      | Multiplication (`A * B`)     |
| 0011      | Division (`A / B`)           |
| 0100      | Logical shift left (`A << 1`)|
| 0101      | Logical shift right (`A >> 1`)|
| 0110      | Rotate left                  |
| 0111      | Rotate right                 |
| 1000      | Logical AND (`A & B`)        |
| 1001      | Logical OR (`A | B`)         |
| 1010      | Logical XOR (`A ^ B`)        |
| 1011      | Logical NOR (`~(A | B)`)     |
| 1100      | Logical NAND (`~(A & B)`)    |
| 1101      | Logical XNOR (`~(A ^ B)`)    |
| 1110      | Greater comparison (`A > B`) |
| 1111      | Equality comparison (`A == B`)|

## Project Structure
The project is organized as follows:

```
ALU_VIP3/
├── agent/
│   ├── alu_agent.svh       # UVM agent for ALU
│   ├── alu_driver.svh      # UVM driver
│   ├── alu_if.sv           # ALU interface
│   ├── alu_monitor.svh     # UVM monitor
│   └── alu_seq_item.svh    # Sequence item
├── env/
│   └── alu_env.svh         # UVM environment
├── package/
│   └── alu_pkg.sv          # ALU package
├── rtl/
│   └── alu.v               # ALU RTL design
├── scoreboard/
│   └── alu_scoreboard.svh  # UVM scoreboard
├── scripts/
│   ├── debug.f             # Debug script
│   └── run.f               # Run script
├── sequence/
│   └── alu_base_sequence.svh # Base sequence
├── sim/
│   ├── dsim.env            # Simulation environment
│   ├── waves.mxd           # Waveform configuration
│   └── dsim_work/          # Simulation work directory
├── test/
│   └── alu_test.svh        # Testbench
└── testbench/
    └── tb_top.sv           # Top-level testbench
```

## How to Run
1. **Set up the environment:**
   - Ensure you have a SystemVerilog simulator (e.g., VCS, QuestaSim, or Xcelium) installed.
   - Add the required simulator binaries to your PATH.

2. **Compile the design and testbench:**
   ```bash
   vlog -f scripts/run.f
   ```

3. **Run the simulation:**
   ```bash
   vsim -c -do "run -all" tb_top
   ```

4. **View the waveform:**
   Open the `waves.mxd` file in your waveform viewer.

## References
- [FPGA4Student: Verilog code for ALU](https://www.fpga4student.com/2017/06/Verilog-code-for-ALU.html)
- [UVM Methodology](https://www.accellera.org/downloads/standards/uvm)

## License
This project is for educational purposes only. The ALU design is sourced from [FPGA4Student](https://www.fpga4student.com/).