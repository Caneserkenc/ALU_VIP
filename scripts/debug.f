// scripts/debug.f
-uvm 1.2
-top tb_top
+acc+b
-waves waves.mxd

+UVM_VERBOSITY=UVM_MEDIUM
+UVM_TESTNAME=alu_test

// sim klasöründen baktığımız için yine ../scripts diyoruz

-f ../scripts/run.f

//dsim -f ../scripts/debug.f
