module FrequencyDivider
#(
	parameter COUNTER_BITS = 32,
	parameter InternalClock = 25000000,
	parameter Freq = 10000
)
(
input Clk,
input Rst,
input En,
input [3:0]dutyCycle,
input [1:0] Frequency,
output logic Counting
);

logic [COUNTER_BITS-1:0] Max_Count;
//Reloj 50 Mhz

logic [COUNTER_BITS-1 : 0] Counting_reg = 0;
logic flag = 0;

assign Max_Count = (InternalClock/((Frequency*Freq)+Freq));

always_ff@(posedge Clk or negedge Rst) begin: ThisIsACounter
	if (Rst == 1'b0)begin
		Counting_reg <= {COUNTER_BITS{1'b0}};
		
	end
	else 
	begin	
		if(En == 1'b1)
		begin
			if(Counting_reg == Max_Count)
				begin 
					Counting_reg <= {COUNTER_BITS{1'b0}};
				end
			else
				Counting_reg <= Counting_reg + 1'b1;
				
				
				
				
			if(Counting_reg < ((Max_Count/8)*dutyCycle))
				begin
					//flag <= ~flag;
					flag <= 1;
					//Counting_reg <= {COUNTER_BITS{1'b0}};
				end
			else if(Counting_reg > ((Max_Count/8)*dutyCycle))
				begin
					flag <= 0;
				end

		end
		else begin
			Counting_reg <= Counting_reg;
			
		end
	end	
end: ThisIsACounter

assign Counting = flag;

endmodule
