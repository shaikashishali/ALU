// File: alu_tb.v
`timescale 1ns / 1ps

module ALU_tb;

reg [7:0] A;
reg [7:0] B;
reg [2:0] ALU_Sel;
wire [7:0] ALU_Out;

// Instantiate the ALU module
ALU uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out)
);

initial begin
    $dumpfile("wave.vcd");       // For waveform viewing
    $dumpvars(0, ALU_tb);

    // Test values
    A = 8'd12;
    B = 8'd4;

    // Test Addition
    ALU_Sel = 3'b000; 
    #10;

    // Test Subtraction
    ALU_Sel = 3'b001; 
    #10;

    // Test Bitwise AND
    ALU_Sel = 3'b010; 
    #10;

    // Test Bitwise OR
    ALU_Sel = 3'b011; 
    #10;

    // Test Bitwise NOT (on A)
    ALU_Sel = 3'b100; 
    #10;

    // Test Division (A / B)
    ALU_Sel = 3'b101; 
    #10;

    // Test Division by zero
    B = 8'd0;          // Change B to 0
    ALU_Sel = 3'b101; 
    #10;

    $finish;
end

endmodule
