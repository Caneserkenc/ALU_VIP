class alu_monitor extends uvm_monitor;

  `uvm_component_utils(alu_monitor);
   
  virtual alu_if vif;

  uvm_analysis_port #(alu_seq_item) mon_ap;

  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);

     mon_ap = new("mon_ap", this);

     if(!uvm_config_db #(virtual alu_if):: get(this, "","vif",vif))
       `uvm_fatal("NOVIF", "virtual interface not found!");

  endfunction 

  virtual task run_phase(uvm_phase phase);
    alu_seq_item mon_tr;

    forever begin
        @(posedge vif.clk);

        mon_tr = alu_seq_item::type_id::create("mon_tr");

        mon_tr.A       = vif.A;
        mon_tr.B       = vif.B;
        mon_tr.ALU_Sel = vif.ALU_Sel;
        mon_tr.ALU_Out = vif.ALU_Out;
        mon_tr.CarryOut = vif.CarryOut;

        mon_ap.write(mon_tr);

    end 

     
  endtask 


endclass 