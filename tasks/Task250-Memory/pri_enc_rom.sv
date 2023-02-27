module pri_enc_rom (output logic [2:0] Y, input logic A, B, C);


// Declare the ROM variable
	logic [2:0] rom[0:7] = '{
	
		3'b000,
		3'b100,
		3'b100,
		3'b100,
		3'b101,
		3'b101,
		3'b110,
		3'b111
		};

	assign Y = rom[{A, B, C}];

endmodule