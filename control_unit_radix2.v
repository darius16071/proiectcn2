module control_unit_radix2 (
    input [1:0] q_pair,    // Q_temp_q[1:0] -> Q0 and Q-1
    input       is_done,
    output reg  add_M,
    output reg  sub_M
);
    always @(*) begin
        add_M = 1'b0;
        sub_M = 1'b0;
        if (!is_done) begin
            case (q_pair)
                2'b00: ; // Do nothing (shift only)
                2'b01: add_M = 1'b1; // A = A + M
                2'b10: sub_M = 1'b1; // A = A - M
                2'b11: ; // Do nothing (shift only)
                default: ; // Should not happen
            endcase
        end
    end
endmodule
