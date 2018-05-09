module PWM
#(
	parameter WORD_LENGTH = 8
)

(
	// Input Ports
	input clk,
	input reset,
	input start,
	input [WORD_LENGTH-1:0] dutyCycle,
	input [1:0] frequency,
	

	output pwm_output

);

wire [WORD_LENGTH-1:0] porcentaje;

FrequencyDivider
#(
	.COUNTER_BITS(32)
)
MainFrequency
(
	//inputs
	.Clk(clk),
	.Rst(reset),
	.En(1),
	.dutyCycle(porcentaje),
	.Frequency(frequency),
	//outputs
	.Counting(pwm_output)
);

Dutycycle
Cycle
(
	.Data_In(dutyCycle),
	.Data_Out(porcentaje)

);





endmodule
