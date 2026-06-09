module alu(
  input [3:0] A,        // 4 bit input A
  input [3:0] B,        // 4 bit input B
  input [2:0] SEL,      // operation selector
  output reg [3:0] result, // 4 bit output
  output reg zero,      // 1 if result is 0000
  output reg carry      // 1 if addition overflows
);

  always @(*) begin
    carry = 0;          // default carry to 0
    
    case(SEL)
      3'b000: begin     // ADD
        {carry, result} = A + B;
      end
      
      3'b001: begin     // SUB
        result = A - B;
      end
      
      3'b010: begin     // AND
        result = A & B;
      end
      
      3'b011: begin     // OR
        result = A | B;
      end
      
      3'b100: begin     // XOR
        result = A ^ B;
      end
      
      3'b101: begin     // NOT A
        result = ~A;
      end
      
      default: begin
        result = 4'b0000;
      end
    endcase
    
    // Zero flag
    zero = (result == 4'b0000) ? 1 : 0;
  end

endmodule
