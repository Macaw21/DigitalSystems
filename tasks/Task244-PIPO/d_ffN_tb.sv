module d_ffN_tb;

parameter N = 8;

logic clk, n_res, en;
logic [N-1:0] Q, D;

//instantiate components
d_ffN #(.N(N))u1 (Q, D, clk, n_res, en);

initial begin
	clk = 0;
	repeat(20)
		#50ps clk = ~clk;
end

initial
	begin
	//Initialise
	D = 0;

	//RESET
	n_res = 0;
	#10ps;
	n_res = 1;
	
	//ENABALED
	en = '1;

	//Test for when D = 10101010
	@(negedge clk);	//Wait for negative edge of clock
	D = 8'b10101010;		//Set D = 10101010
	@(posedge clk);	//Wait for positive edge of clock
	#11 assert(Q == D) $display("PASS"); else $error("FAIL: Q = %b", Q);	//Check Q

	//DISABLED	
	en = '0;

	//CHANGE INPUT AND DISBLE D = 01010101
	@(negedge clk);	//Wait for negative edge of clock
	D = 8'b01010101;		//Set D = 10101010
	@(posedge clk);	//Wait for positive edge of clock
	//should keep previous value of D
	#11 assert(Q == 8'b10101010) $display("PASS"); else $error("FAIL: Q = %b", Q);	//Check Q

	//ENABALED
	en = '1;

	//Test for when D = 01010101
	@(negedge clk);	//Wait for negative edge of clock
	D = 8'b01010101;		//Set D = 01010101
	@(posedge clk);	//Wait for positive edge of clock
	#11 assert(Q == D) $display("PASS"); else $error("FAIL: Q = %b", Q);	//Check Q
	

	//Test D is ignored when reset
	@(negedge clk);	//Wait for negative edge of clock
	D = 8'b10101010;
	@(posedge clk);	//Wait for positive edge of clock
	@(negedge clk);	//Wait for negative edge of clock
	n_res = 0;
	D = 8'b01010101;
	@(posedge clk);	//Wait for positive edge of clock
	#1 assert(Q == 8'd0) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	@(negedge clk);	//Wait for negative edge of clock
	n_res = 1;
	@(posedge clk);	//Wait for positive edge of clock
	@(negedge clk);	//Wait for negative edge of clock

	end

always @(negedge n_res) begin
	#11 assert(Q == 8'b00000000) $display("RESET PASS"); else $error("RESET FAIL");	//Check Q
	
end


endmodule