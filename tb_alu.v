module tb_alu;
  reg [3:0] A;
  reg [3:0] B;
  reg [2:0] SEL;
  wire [3:0] result;
  wire zero;
  wire carry;

  alu uut(
    .A(A),
    .B(B),
    .SEL(SEL),
    .result(result),
    .zero(zero),
    .carry(carry)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_alu);

    $display("=========================");
    $display("   ALU TEST STARTING     ");
    $display("=========================");

    // Test ADD
    A = 4'b0011; B = 4'b0101; SEL = 3'b000;
    #10;
    $display("ADD  : %b + %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test SUB
    A = 4'b0111; B = 4'b0011; SEL = 3'b001;
    #10;
    $display("SUB  : %b - %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test AND
    A = 4'b1010; B = 4'b1100; SEL = 3'b010;
    #10;
    $display("AND  : %b & %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test OR
    A = 4'b1010; B = 4'b0101; SEL = 3'b011;
    #10;
    $display("OR   : %b | %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test XOR
    A = 4'b1010; B = 4'b1010; SEL = 3'b100;
    #10;
    $display("XOR  : %b ^ %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test NOT
    A = 4'b1010; B = 4'b0000; SEL = 3'b101;
    #10;
    $display("NOT  : ~%b = %b | carry=%b zero=%b",
              A, result, carry, zero);

    // Test zero flag
    A = 4'b0000; B = 4'b0000; SEL = 3'b010;
    #10;
    $display("ZERO : %b & %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    // Test carry flag
    A = 4'b1111; B = 4'b0001; SEL = 3'b000;
    #10;
    $display("CARRY: %b + %b = %b | carry=%b zero=%b",
              A, B, result, carry, zero);

    $display("=========================");
    $display("   ALU TEST COMPLETE     ");
    $display("=========================");

    #10;
    $finish;
  end

endmodule
