class alu_seq_item extends uvm_sequence_item;

    `uvm_object_utils(alu_seq_item)

    rand logic [7:0] A;
    rand logic [7:0] B;
    rand logic [3:0] ALU_Sel;
    
    logic [7:0] ALU_Out;
    logic       CarryOut;
   
    constraint c_div_zero_protection {
        (ALU_Sel == 4'b0011) -> (B != 0);
    }

    function new(string name ="alu_seq_item");
       super.new(name);
    endfunction      

endclass