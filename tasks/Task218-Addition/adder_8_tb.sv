module adder_8_tb;

//4 bit
parameter N = 4;
parameter M = 2*N;

logic [M-1:0] a, b, sum;
logic cout, cout_internal;


//instantiate adder

adder_N #(.N(N)) u1(sum[N-1:0], cout_internal, a[N-1:0], b[N-1:0], 0);
adder_N #(.N(N)) u2(sum[M-1:N], cout, 		a[M-1:N], b[M-1:N], cout_internal);

initial 
	begin
	  automatic int S;
	    for (int i=0; i<2**M; i = i + 1) begin
              for (int j=i; j<2**M; j = j + 1) begin
                a = i;
                b = j;
		S = i + j;	//Integer summation
                #10ps;
		assert ({cout,sum} == S) $display("PASS"); else $display("ERROR %d + %d <> %d", i, j, SUM);
              end
            end
	end


endmodule