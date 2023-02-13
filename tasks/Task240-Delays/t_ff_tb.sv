module t_ff_tb;

logic CLK = 0;
logic T, n_res, Q;

//Instantiate a DFF
t_ff u1(Q,T,CLK,n_res);

//Generate 5 clock cycles
initial begin
	CLK=0;
     	repeat(20) 
		#50ps CLK = ~CLK;  
end 

//Tests (synchronous - write on falling edge of the clock; read on rising)
initial begin
	//Initialise
	T = 0;
	n_res = 0;
	#10ps;
	n_res = 1;

	//Test for when D = 1
	@(negedge CLK);	//Wait for negative edge of clock
	T = 1;		//Set T = 1
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock

	//Test for when T = 0
	T = 0;		//Set T = 0
	@(posedge CLK);	//Wait for negative edge of clock
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock
	@(posedge CLK);	//Wait for positive edge of clock
	@(negedge CLK);	//Wait for negative edge of clock

end

always @(negedge n_res) begin
	#1 assert(Q == 0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	
end

endmodule