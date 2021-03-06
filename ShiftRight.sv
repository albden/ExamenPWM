module ShiftRight
#(
	parameter WORD_LENGTH = 8
)
(
	input [WORD_LENGTH-1:0] Data_In,
	input [2:0] Shift,
	output [WORD_LENGTH-1:0] Data_Out
);



assign Data_Out = Data_In >> Shift;

endmodule
