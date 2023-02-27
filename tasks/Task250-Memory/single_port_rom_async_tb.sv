module single_port_rom_async_tb;

parameter data_wid = 8;
parameter addr_wid = 3;


//Internal signals
logic [addr_wid-1:0] ADDR1, ADDR2;
logic [data_wid-1:0] Q1, Q2, Q_exp;

//Instantiate componet
single_port_rom_async #(.DATA_WIDTH(data_wid), .ADDR_WIDTH(addr_wid)) u1 (ADDR1, Q1);
single_port_rom_async2 #(.DATA_WIDTH(data_wid), .ADDR_WIDTH(addr_wid)) u2 (ADDR2, Q2);

//task (saves on repetition)
task check(logic [addr_wid-1:0] addr_int, logic [data_wid-1 : 0] Q_exp);

	ADDR1 = addr_int;
	ADDR2 = ADDR1;
	#10ps;
	assert (Q1 == Q_exp)
		$display("Q1 Passed for select line %b: Output %b", addr_int, Q1);
	else
		$error("Q1 Failed for address line %b: Output %b. Expected %b, got %b = %B", addr_int, Q1, Q_exp, Q1, Q2);
	assert (Q2 == Q_exp)
		$display("Q2 Passed for select line %b: Output %b", addr_int, Q2);
	else
		$error("Q2 Failed for address line %b: Output %b. Expected %b, got %b = %B", addr_int, Q2, Q_exp, Q1, Q2);
endtask


initial
begin
//write test code in here

//set input
	check(3'd0, 8'b10101010);
	check(3'd1, 8'b11110000);
	check(3'd2, 8'b00001111);
	check(3'd3, 8'b11001100);
	check(3'd4, 8'b11100111);
	check(3'd5, 8'b00011000);
	check(3'd6, 8'b10110111);
	check(3'd7, 8'b11101101);

end

endmodule