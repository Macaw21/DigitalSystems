module t_ff (output logic Q, input logic T, CLK, n_Reset);

always_ff @(posedge CLK, negedge n_Reset) begin
	//Reset takes precedence
	if (n_Reset == 1'b0) begin
		Q <= 0;
	end
	else if (T == 1) begin
		//Otherwise Q = notQ (and latches)
		Q <= ~Q;
	end
end

endmodule