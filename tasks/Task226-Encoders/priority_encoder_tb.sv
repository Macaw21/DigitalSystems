module priority_encoder_tb;

logic [1:0] y;
logic valid;
logic [3:0] a;

priority_encoder u1(y, valid, a);

int expected_y[0:15] = { 0, 0, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3};
int expected_v[0:15] = { 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1};
initial
begin
	for (int n=0; n<16; n=n+1) begin
		a = n;
		#10ps;
		assert (y == expected_y[n]) 
			$display("    Y=%b PASS: a = %2d", y, n); 
		else 
			$error("a = %d, expected Y=%d and got %d", n, expected_y[n], y);

		// TODO: Add an assert statement to check the valid output
		
		assert (valid == expected_v[n])
			$display("Validity = %b\t PASSED", valid);
		else
			$error("ERROR - Validity = %b, expected Valid=%b and got %b", n, expected_v[n], valid);
	end
end

endmodule

