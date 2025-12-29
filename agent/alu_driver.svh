class alu_driver extends uvm_driver #(alu_seq_item);

   `uvm_component_utils(alu_driver);
   
     virtual alu_if vif;

     function new(string name, uvm_component parent);
        super.new(name, parent);
     endfunction

     virtual function void build_phase(uvm_phase phase);
       super.build_phase(phase);
       if(!uvm_config_db #(virtual alu_if):: get(this, "", "vif",vif))
          `uvm_fatal("NOVIF", "virtual interface not found!");

     endfunction 


     virtual task run_phase(uvm_phase phase); 
     
       alu_seq_item tr;
       
        vif.A       <= '0;
        vif.B       <= '0;
        vif.ALU_Sel <= '0;
        @(posedge vif.clk);
        
       forever begin 
         seq_item_port.get_next_item(tr);
          
         @(posedge vif.clk);
           vif.A       <= tr.A;
           vif.B       <= tr.B;
           vif.ALU_Sel <= tr.ALU_Sel;

           `uvm_info("ALU_DRIVER", $sformatf("driving item A = %0d, B = %0d, ALU_Sel=%0d", tr.A, tr.B, tr.ALU_Sel) , UVM_LOW)


         seq_item_port.item_done();

       end 

     endtask 
endclass