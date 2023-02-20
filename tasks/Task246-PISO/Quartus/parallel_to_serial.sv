module parallel_to_serial #(parameter N=4) 	(
						output logic SOUT, 
						input logic[N-1:0] DataW,
						input logic clk, 
						input logic en, 
						input logic shift,
						input logic n_reset
						);


logic [N-1:0] sr;

//output is LSB
assign SOUT = sr[0];

always_ff @(posedge clk, negedge n_reset) begin

		//if reset, set output to 0.
		if(n_reset == 1'b0) begin
			sr = '0;
		end
		
		else begin
	
			//load dataW to output
			if ((en == 1) && (shift == 0)) begin
				sr <= DataW;
			end
			
			else begin
				if((en == 1) && (shift == 1)) begin
				//0 in MSB position, shift internal register
				sr <= {1'b0, sr[N-1:1]};
				end
			end

		
		
		end
	

end


endmodule
