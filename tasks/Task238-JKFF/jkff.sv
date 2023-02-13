module jkff (output logic Q, input logic J, K, CLK);

always_ff @(negedge CLK) 
	begin
		
		if ({J,K} == 2'b11)		//toggle output
		Q <= ~Q;
		else if ({J,K} == 2'b10)	//set Q
		Q <= 1;
		else if ({J,K} == 2'b01)	//reset Q
		Q <= 0;
	end

endmodule