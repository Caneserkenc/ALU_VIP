class alu_base_sequence extends uvm_sequence#(alu_seq_item);

    `uvm_object_utils(alu_base_sequence)

    int i = 10;

    function new(string name = "alu_base_sequence");
        super.new(name);
    endfunction

    virtual task body();
        alu_seq_item req;

        repeat(i) begin 
            req = alu_seq_item::type_id::create("req");
            start_item(req);
           if (!req.randomize()) begin 
            `uvm_error("SEQ","randomization error")
           end
            finish_item(req);
        end 
    endtask 
endclass 