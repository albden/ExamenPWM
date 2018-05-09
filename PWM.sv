module PWM
#(
	parameter FREQ_LENGTH = 2,
	parameter WORD_LENGTH = 8
)

(
	// Input Ports
	input clk,
	input reset,
	input start,
	input [WORD_LENGTH-1:0] dutyCycle,
	input [FREQ_LENGTH-1:0] frequency,
	

	output pwm_output

);

wire [3:0] porcentaje;

Dutycycle
Cycle
(
	.Data_In(dutyCycle),
	.Data_Out(porcentaje)

);


FrequencyDivider
#(
	.COUNTER_BITS(32)
)
MainFrequency
(
	//inputs
	.Clk(clk),
	.Rst(reset),
	.En(start),
	.dutyCycle(porcentaje),
	.Frequency(frequency),
	//outputs
	.Counting(pwm_output)
);






endmodule
