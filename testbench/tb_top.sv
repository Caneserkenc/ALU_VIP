`include "uvm_macros.svh"
import uvm_pkg::*;
import alu_pkg::*;


module tb_top;


logic clk;
initial begin 
    clk = 0;
    forever #5 clk = ~clk;
end

alu_if vif(clk);

alu dut(

    .A(vif.A),
    .B(vif.B),
    .ALU_Sel(vif.ALU_Sel),
    .ALU_Out(vif.ALU_Out),
    .CarryOut(vif.CarryOut)
);


initial begin 
    uvm_config_db#(virtual alu_if)::set(null, "*","vif",vif);
    run_test();
end
endmodule 

