module counterN #(parameter N=8) (
	output logic [N-1:0] Y, 
	input  logic CLK, 
	input logic N_RESET,
	input logic DIR);

logic [N-1:0] count;

//Connect output to internal register count
assign Y = count;

always_ff @(posedge CLK) begin
	if (N_RESET == 0) 
		count <= 0;
	else begin
		if (DIR == 1) begin
			if (count < ((2**N)-1)) begin
			count <= count + 1;
			end
		end	
		else if (count > 0) begin
		count <= count - 1;
		end	
	end
end

endmodule


 