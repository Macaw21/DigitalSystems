module fsm_tb;

logic clk, x, reset, Q_moore, Q_mealy;

//Instantiate both FSM types
fsm_mealy u1(.clk(clk), .reset(reset), .X(x), .Q(Q_mealy));
fsm_moore u2(.clk(clk), .reset(reset), .X(x), .Q(Q_moore));

initial begin
   reset = '0;
   #10ps reset = '1;
end

initial begin

   //Generate clock here 
	clk = 0;

	repeat (8) begin
	#50ps;
	clk = ~clk;  
	end

end

initial begin
   x = '0;
   @(negedge clk);
   
   //Write tests here
	
	//reset and check in state 0 - output 0
	reset = 0;
	#10ps;
	reset = 1;


	@(posedge clk);
	assert (Q_mealy == 0) $display("PASSED - Mealy output = %b", Q_mealy);
	else $error ("FAILED- Mealy output = %b", Q_mealy);
	assert (Q_moore == 0) $display("PASSED - Moore output = %b", Q_moore);
	else $error ("FAILED- Moore output = %b", Q_moore);
	assert (Q_mealy == Q_moore) $display("Outputs match"); else $error("outputs differ");

	//set X - transition to state 1 - output 1
	@(negedge clk);
   	x = 1;
	@(posedge clk);
	assert (Q_mealy == 1) $display("PASSED - Mealy output = %b", Q_mealy);
	else $error ("FAILED- Mealy output = %b", Q_mealy);
	assert (Q_moore == 1) $display("PASSED - Moore output = %b", Q_moore);
	else $error ("FAILED- Moore output = %b", Q_moore);
	assert (Q_mealy == Q_moore) $display("Outputs match"); else $error("outputs differ");

	//set X - stay in state 1 - output 0
	@(negedge clk);
	 x = 1;
	@(posedge clk);
	assert (Q_mealy == 0) $display("PASSED - Mealy output = %b", Q_mealy);
	else $error ("FAILED- Mealy output = %b", Q_mealy);
	assert (Q_moore == 0) $display("PASSED - Moore output = %b", Q_moore);
	else $error ("FAILED- Moore output = %b", Q_moore);
	assert (Q_mealy == Q_moore) $display("Outputs match"); else $error("outputs differ");

	//X = 0, transition to state 0 - output 0
	@(negedge clk);
   	x = 0;
	@(posedge clk);
	assert (Q_mealy == 0) $display("PASSED - Mealy output = %b", Q_mealy);
	else $error ("FAILED- Mealy output = %b", Q_mealy);
	assert (Q_moore == 0) $display("PASSED - Moore output = %b", Q_moore);
	else $error ("FAILED- Moore output = %b", Q_moore);
	assert (Q_mealy == Q_moore) $display("Outputs match"); else $error("outputs differ");

end

endmodule

