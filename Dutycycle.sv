module Dutycycle
#(
	parameter WORD_LENGTH = 8
)
(
	input [WORD_LENGTH-1:0] Data_In,
	
	output [WORD_LENGTH-1:0] Data_Out
);

logic [WORD_LENGTH-1:0]Out;
always_comb begin 
	case(Data_In)
		8'b10000000: Out=8;
		8'b01000000: Out=7;
		8'b00100000: Out=6;
		8'b00010000: Out=5;
		8'b00001000: Out=4;
		8'b00000100: Out=3;
		8'b00000010: Out=2;
		8'b00000001: Out=1;
		8'b00000000: Out=0;
		default: Out = 0;
	endcase
end

assign Data_Out = Out;

endmodule
