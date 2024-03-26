//this testbench tests for all the odd and even instructions, and the checks latency and forwarding logic.

module part1_tb();
	
	logic clk, reset;
	logic [0:31] PCin;
	logic [0:6] op_even;
	logic [0:6] op_odd;
	logic [0:6] RAaddr_even, RBaddr_even, RCaddr_even, RTaddr_even, RAaddr_odd, RBaddr_odd, RCaddr_odd, RTaddr_odd;
	logic [0:17] Imm_even, Imm_odd;

	logic branchTaken;
	logic [0:31] PCout;


	part1 part1Inst(clk, reset, PCin, op_even, RAaddr_even, RBaddr_even, RCaddr_even, Imm_even, RTaddr_even, op_odd, RAaddr_odd, RBaddr_odd, RCaddr_odd, Imm_odd, RTaddr_odd, PCout, branchTaken);

	initial clk = 1;
	always #5 clk = ~clk;
	always #10 PCin = PCout;


	initial begin

		@(posedge clk); 
		#1; reset = 1; op_even = 85; op_odd = 84;
		

		@(posedge clk); 
		#1; reset = 0;
		op_even = 3; RAaddr_even = 2; RBaddr_even = 3; RCaddr_even = 4; RTaddr_even = 5; Imm_even = 18'd30;
		op_odd = 66; RAaddr_odd = 6; RBaddr_odd = 7; RCaddr_odd = 0; RTaddr_odd = 8; Imm_odd = 18'd2; PCin = 0;
		
		
		
		for(int i=0; i<8; i++) begin
			for (int j =1; j<9; j++) begin
				@(posedge clk);
				#1; reset = 0;
				
				op_even = (j+8*i)>62 ? 85 : j+8*i;
				RTaddr_even = j; RAaddr_even = j+1; RBaddr_even = j+2; RCaddr_even = j+3; Imm_even = 18'd2;


				op_odd = (j+8*i+62)>82 ? 84 : j+8*i+62;
				RAaddr_odd = 20*j; RBaddr_odd = 20*j+1; RTaddr_odd = 20*j+2; Imm_odd = 18'd3;
			
			end
		end
		
		for(int i=0; i<20; i++) begin
			@(posedge clk); #1; op_even = 85; op_odd = 84;
		end

		
		
		
		
		@(posedge clk); 
		#1; reset = 1; op_even = 85; op_odd = 84;
		
		
		@(posedge clk);
		#1; reset = 0;
		op_even = 1; RTaddr_even = 1; RAaddr_even = 2; RBaddr_even = 3; RCaddr_even = 4; Imm_even = 18'd2;
		op_odd = 65; RTaddr_odd = 20; RAaddr_odd = 21; RBaddr_odd = 22; Imm_odd = 18'd3;
		
		
		@(posedge clk);
		#1; reset = 0;
		op_even = 1; RTaddr_even = 2; RAaddr_even = 3; RBaddr_even = 4; RCaddr_even = 5; Imm_even = 18'd2;
		op_odd = 66; RTaddr_odd = 21; RAaddr_odd = 22; RBaddr_odd = 23; Imm_odd = 18'd3;
		
		
		@(posedge clk);
		#1; reset = 0;
		op_even = 1; RTaddr_even = 2; RAaddr_even = 4; RBaddr_even = 5; RCaddr_even = 6; Imm_even = 18'd2;
		op_odd = 66; RTaddr_odd = 21; RAaddr_odd = 23; RBaddr_odd = 24; Imm_odd = 18'd3;
		
		
		
		@(posedge clk); 
		#1; reset = 0; op_even = 85; op_odd = 84;
			
		@(posedge clk); 
		#1; reset = 0; op_even = 85; op_odd = 84;
		
		@(posedge clk); 
		#1; reset = 0; op_even = 85; op_odd = 84;

		
		@(posedge clk);
		#1; reset = 0;
		op_even = 31; RTaddr_even = 3; RAaddr_even = 2; RBaddr_even = 20; RCaddr_even = 1; Imm_even = 18'd2;
		op_odd = 66; RTaddr_odd = 22; RAaddr_odd = 21; RBaddr_odd = 1; Imm_odd = 18'd3;
		
		
		
		
		for(int i=0; i<15; i++) begin
			@(posedge clk); #1; op_even = 85; op_odd = 84;
		end
		
		
		
		
		
		//->take care of PC, also one pair of instruction with nop and stop
		
		@(posedge clk); 
		#1; reset = 0; op_even = 85; op_odd = 83;
		
		


		for(int i=0; i<100; i++) begin
			@(posedge clk);
			#1; op_even = 85; op_odd = 84;
		end


		$stop;


	end


endmodule




