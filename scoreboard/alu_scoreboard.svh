class alu_scoreboard extends uvm_scoreboard;

    `uvm_component_utils(alu_scoreboard)

    uvm_analysis_imp #(alu_seq_item, alu_scoreboard) analysis_export;

   int match_count    = 0;
   int mismatch_count = 0;
    function new(string name, uvm_component parent);
        super.new(name, parent);
        analysis_export = new("analysis_export", this);
    endfunction 

    function void write(alu_seq_item item);

       logic [7:0] ALU_expected_Result;

        case(item.ALU_Sel)

        4'b0000:    ALU_expected_Result = item.A + item.B ; 
        4'b0001:    ALU_expected_Result = item.A - item.B ;
        4'b0010:    ALU_expected_Result = item.A * item.B;
        4'b0011:    ALU_expected_Result = item.A/item.B;
        4'b0100:    ALU_expected_Result = item.A<<1;
        4'b0101:    ALU_expected_Result = item.A>>1;
        4'b0110:    ALU_expected_Result = {item.A[6:0],item.A[7]};
        4'b0111:    ALU_expected_Result = {item.A[0],item.A[7:1]};
        4'b1000:    ALU_expected_Result = item.A & item.B;
        4'b1001:    ALU_expected_Result = item.A | item.B;
        4'b1010:    ALU_expected_Result = item.A ^ item.B;
        4'b1011:    ALU_expected_Result = ~(item.A | item.B);
        4'b1100:    ALU_expected_Result = ~(item.A & item.B);
        4'b1101:    ALU_expected_Result = ~(item.A ^ item.B);
        4'b1110:    ALU_expected_Result = (item.A>item.B)?8'd1:8'd0 ;
        4'b1111:    ALU_expected_Result = (item.A==item.B)?8'd1:8'd0 ;
          default:  ALU_expected_Result = item.A + item.B ; 
        endcase

        if(ALU_expected_Result == item.ALU_Out) begin 
            match_count++;
            `uvm_info("SCB", $sformatf("PASS: A=%0d B=%0d sel=%0d--> out=%0d", item.A, item.B, item.ALU_Sel, item.ALU_Out), UVM_HIGH)
        end 
        else begin 
            `uvm_error("SCB", $sformatf("FAIL!! A=%0d B=%0d sel=%0d exp=%0h act=%0h", item.A, item.B, item.ALU_Sel, ALU_expected_Result, item.ALU_Out))
            mismatch_count++;
        end 
    endfunction 

    virtual function void report_phase(uvm_phase phase);
        super.report_phase(phase);

        `uvm_info("SCB_REPORT", $sformatf("total matches : %0d", match_count),UVM_NONE)
        `uvm_info("SCB_REPORT", $sformatf("total mismatches : %0d",mismatch_count), UVM_NONE)

        if(mismatch_count == 0)
            `uvm_info("SCB_REPORT", "TEST PASSED! ", UVM_NONE)
        else 
            `uvm_error("SCB_REPORT", "TEST FAILED! ")
            

    endfunction 


endclass