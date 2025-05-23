// File: alu.v
module ALU (
    input  [7:0] A,
    input  [7:0] B,
    input  [2:0] ALU_Sel,
    output reg [7:0] ALU_Out
);
    always @(*) begin
        case (ALU_Sel)
            3'b000: ALU_Out = A + B;                 // Addition
            3'b001: ALU_Out = A - B;                 // Subtraction
            3'b010: ALU_Out = A & B;                 // AND
            3'b011: ALU_Out = A | B;                 // OR
            3'b100: ALU_Out = ~A;                    // NOT (on A)
            3'b101: ALU_Out = (B != 0) ? A / B : 8'b00000000; // Division
            default: ALU_Out = 8'b00000000;
        endcase
    end
endmodule
