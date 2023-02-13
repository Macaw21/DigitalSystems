module jkff_tb;

logic J, K, CLK, Q;

//instantiate component
jkff u1 (Q, J, K, CLK);

//Generate 10 clock cycles
initial begin
	CLK=0;
     	repeat(20) 
		#50ps CLK = ~CLK;  
end 

initial
	begin

	$display("| J | K | Q |");
	//Set Q HIGH
	@(posedge CLK);
	{J,K} = 2'b10;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Latch
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Set Q LOW
	@(posedge CLK);
	{J,K} = 2'b01;
	@(negedge CLK);
	#1ps assert (Q == 0) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);


	//latch
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	#1ps assert (Q == 0) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Latch
	@(posedge CLK);
	{J,K} = 2'b00;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1ps assert (Q == 0) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1ps assert (Q == 0) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);

	//Toggle Q
	@(posedge CLK);
	{J,K} = 2'b11;
	@(negedge CLK);
	#1ps assert (Q == 1) $display("| %b | %b | %b |\t PASSED", J, K, Q);
	else $display("FAILED\t| J%b | K%b | Q%b |", J, K, Q);
	end

endmodule