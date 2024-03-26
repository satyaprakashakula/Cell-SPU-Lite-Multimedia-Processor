module part1(clk, reset, PCin, op_even, RAaddr_even, RBaddr_even, RCaddr_even, Imm_even, RTaddr_even, op_odd, RAaddr_odd, RBaddr_odd, RCaddr_odd, Imm_odd, RTaddr_odd, PCout, branchTaken);
	

	input clk, reset;
	input [0:31] PCin;
	input [0:6] op_even;
	input [0:6] op_odd;
	input [0:6] RAaddr_even, RBaddr_even, RCaddr_even, RTaddr_even, RAaddr_odd, RBaddr_odd, RCaddr_odd, RTaddr_odd;
	input [0:17] Imm_even, Imm_odd;

	output logic branchTaken;
	output logic [0:31] PCout;


	logic [0:127] RA_even, RA_even_fw, RA_even1, RB_even, RB_even_fw, RB_even1, RC_even, RC_even_fw, RC_even1, RA_odd, RA_odd_fw, RA_odd1, RB_odd, RB_odd_fw, RB_odd1, RC_odd, RC_odd_fw, RC_odd1;
	logic [0:6] op_even1;
	logic [0:6] op_odd1;
	logic [0:17] Imm_even1, Imm_odd1;
	logic [0:31] PCin1;



	 


	logic [0:6] RTaddr_even1, RTaddr_even2, RTaddr_even3, RTaddr_even4, RTaddr_even5, RTaddr_even6, RTaddr_even7, RTaddr_odd1, RTaddr_odd2, RTaddr_odd3, RTaddr_odd4, RTaddr_odd5, RTaddr_odd6, RTaddr_odd7;
	logic [0:127] RT_even1, RT_even2, RT_even3, RT_even4, RT_even5, RT_even6, RT_even7, RT_odd1, RT_odd2, RT_odd3, RT_odd4, RT_odd5, RT_odd6, RT_odd7;
	logic [0:2] uid_even1, uid_even2, uid_even3, uid_even4, uid_even5, uid_even6, uid_even7, uid_odd1, uid_odd2, uid_odd3, uid_odd4, uid_odd5, uid_odd6, uid_odd7;
	logic [0:3] lat_even1, lat_even2, lat_even3, lat_even4, lat_even5, lat_even6, lat_even7;
	logic [0:2] lat_odd1, lat_odd2, lat_odd3, lat_odd4, lat_odd5, lat_odd6, lat_odd7;
	logic regwr_even1, regwr_even2, regwr_even3, regwr_even4, regwr_even5, regwr_even6, regwr_even7, regwr_odd1, regwr_odd2, regwr_odd3, regwr_odd4, regwr_odd5, regwr_odd6, regwr_odd7;


	logic [0:141] packet_even1, packet_odd1;
	logic [0:140] packet_even2, packet_even3, packet_even4, packet_even5, packet_even6, packet_even7, packet_odd2, packet_odd3, packet_odd4, packet_odd5, packet_odd6, packet_odd7;




	always_ff @(posedge clk) begin
		if (reset) begin
			op_even1 <= 0;
			RA_even1 <= 0;
			RB_even1 <= 0;
			RC_even1 <= 0;
			Imm_even1 <= 0;

			op_odd1 <= 0;
			RA_odd1 <= 0;
			RB_odd1 <= 0;
			RC_odd1 <= 0;
			Imm_odd1 <= 0;
		end

		else begin
			op_even1 <= op_even;
			RA_even1 <= RA_even_fw;
			RB_even1 <= RB_even_fw;
			RC_even1 <= RC_even_fw;
			Imm_even1 <= Imm_even;

			op_odd1 <= op_odd;
			RA_odd1 <= RA_odd_fw;
			RB_odd1 <= RB_odd_fw;
			RC_odd1 <= RC_odd_fw;
			Imm_odd1 <= Imm_odd;
			PCin1 <= PCin;
		end
	end


	always_ff @(posedge clk) begin
		if (reset) begin
			RTaddr_even1 <= 0;
			RTaddr_odd1 <= 0;
		end
		else begin
			RTaddr_even1 <= RTaddr_even;
			RTaddr_odd1 <= RTaddr_odd;
		end
	end




	always_ff @(posedge clk) begin
		if (reset) begin
			RTaddr_even2 <= 0;
			RT_even2 <= 0;
			uid_even2 <= 0;
			regwr_even2 <= 0;
			lat_even2 <= 0;
			RTaddr_odd2 <= 0;
			RT_odd2 <= 0;
			uid_odd2 <= 0;
			regwr_odd2 <= 0;
			lat_odd2 <= 0;

			RTaddr_even3 <= 0;
			RT_even3 <= 0;
			uid_even3 <= 0;
			regwr_even3 <= 0;
			lat_even3 <= 0;
			RTaddr_odd3 <= 0;
			RT_odd3 <= 0;
			uid_odd3 <= 0;
			regwr_odd3 <= 0;
			lat_odd3 <= 0;

			RTaddr_even4 <= 0;
			RT_even4 <= 0;
			uid_even4 <= 0;
			regwr_even4 <= 0;
			lat_even4 <= 0;
			RTaddr_odd4 <= 0;
			RT_odd4 <= 0;
			uid_odd4 <= 0;
			regwr_odd4 <= 0;
			lat_odd4 <= 0;

			RTaddr_even5 <= 0;
			RT_even5 <= 0;
			uid_even5 <= 0;
			regwr_even5 <= 0;
			lat_even5 <= 0;
			RTaddr_odd5 <= 0;
			RT_odd5 <= 0;
			uid_odd5 <= 0;
			regwr_odd5 <= 0;
			lat_odd5 <= 0;

			RTaddr_even6 <= 0;
			RT_even6 <= 0;
			uid_even6 <= 0;
			regwr_even6 <= 0;
			lat_even6 <= 0;
			RTaddr_odd6 <= 0;
			RT_odd6 <= 0;
			uid_odd6 <= 0;
			regwr_odd6 <= 0;
			lat_odd6 <= 0;

			RTaddr_even7 <= 0;
			RT_even7 <= 0;
			uid_even7 <= 0;
			regwr_even7 <= 0;
			lat_even7 <= 0;
			RTaddr_odd7 <= 0;
			RT_odd7 <= 0;
			uid_odd7 <= 0;
			regwr_odd7 <= 0;
			lat_odd7 <= 0;

		end


		else begin
			RTaddr_even2 <= RTaddr_even1;
			RT_even2 <= RT_even1;
			uid_even2 <= uid_even1;
			regwr_even2 <= regwr_even1;
			lat_even2 <= lat_even1;
			RTaddr_odd2 <= RTaddr_odd1;
			RT_odd2 <= RT_odd1;
			uid_odd2 <= uid_odd1;
			regwr_odd2 <= regwr_odd1;
			lat_odd2 <= lat_odd1;

			RTaddr_even3 <= RTaddr_even2;
			RT_even3 <= RT_even2;
			uid_even3 <= uid_even2;
			regwr_even3 <= regwr_even2;
			lat_even3 <= lat_even2;
			RTaddr_odd3 <= RTaddr_odd2;
			RT_odd3 <= RT_odd2;
			uid_odd3 <= uid_odd2;
			regwr_odd3 <= regwr_odd2;
			lat_odd3 <= lat_odd2;

			RTaddr_even4 <= RTaddr_even3;
			RT_even4 <= RT_even3;
			uid_even4 <= uid_even3;
			regwr_even4 <= regwr_even3;
			lat_even4 <= lat_even3;
			RTaddr_odd4 <= RTaddr_odd3;
			RT_odd4 <= RT_odd3;
			uid_odd4 <= uid_odd3;
			regwr_odd4 <= regwr_odd3;
			lat_odd4 <= lat_odd3;

			RTaddr_even5 <= RTaddr_even4;
			RT_even5 <= RT_even4;
			uid_even5 <= uid_even4;
			regwr_even5 <= regwr_even4;
			lat_even5 <= lat_even4;
			RTaddr_odd5 <= RTaddr_odd4;
			RT_odd5 <= RT_odd4;
			uid_odd5 <= uid_odd4;
			regwr_odd5 <= regwr_odd4;
			lat_odd5 <= lat_odd4;

			RTaddr_even6 <= RTaddr_even5;
			RT_even6 <= RT_even5;
			uid_even6 <= uid_even5;
			regwr_even6 <= regwr_even5;
			lat_even6 <= lat_even5;
			RTaddr_odd6 <= RTaddr_odd5;
			RT_odd6 <= RT_odd5;
			uid_odd6 <= uid_odd5;
			regwr_odd6 <= regwr_odd5;
			lat_odd6 <= lat_odd5;

			RTaddr_even7 <= RTaddr_even6;
			RT_even7 <= RT_even6;
			uid_even7 <= uid_even6;
			regwr_even7 <= regwr_even6;
			lat_even7 <= lat_even6;
			RTaddr_odd7 <= RTaddr_odd6;
			RT_odd7 <= RT_odd6;
			uid_odd7 <= uid_odd6;
			regwr_odd7 <= regwr_odd6;
			lat_odd7 <= lat_odd6;

		end
	end



	assign packet_even1 = {uid_even1, RT_even1, RTaddr_even1, lat_even1, regwr_even1};
	assign packet_odd1 = {uid_odd1, RT_odd1, RTaddr_odd1, lat_odd1, regwr_odd1};

	always_ff @(posedge clk) begin
		packet_even2 <= packet_even1;
		packet_even3 <= packet_even2;
		packet_even4 <= packet_even3;
		packet_even5 <= packet_even4;
		packet_even6 <= packet_even5;
		packet_even7 <= packet_even6;

		packet_odd2 <= packet_odd1;
		packet_odd3 <= packet_odd2;
		packet_odd4 <= packet_odd3;
		packet_odd5 <= packet_odd4;
		packet_odd6 <= packet_odd5;
		packet_odd7 <= packet_odd6;
		
	end




	regfile regfileInst(.clk(clk), .reset(reset), .RAaddr_even(RAaddr_even), .RBaddr_even(RBaddr_even), .RCaddr_even(RCaddr_even), .RTaddr_even(RTaddr_even7), .RA_even(RA_even), .RB_even(RB_even), .RC_even(RC_even), .RT_even(RT_even7), .regWrite_even(regwr_even7), .RAaddr_odd(RAaddr_odd), .RBaddr_odd(RBaddr_odd), .RCaddr_odd(RCaddr_odd), .RTaddr_odd(RTaddr_odd7), .RA_odd(RA_odd), .RB_odd(RB_odd), .RC_odd(RC_odd), .RT_odd(RT_odd7), .regWrite_odd(regwr_odd7));


	evenpipe evenpipeInst(.clk(clk), .reset(reset), .op(op_even1), .RA(RA_even1), .RB(RB_even1), .RC(RC_even1), .Imm(Imm_even1), .RT(RT_even1), .regWrite(regwr_even1), .lat(lat_even1), .uid(uid_even1));

	oddpipe oddpipeInst(.clk(clk), .reset(reset), .op(op_odd1), .PCin(PCin1), .RA(RA_odd1), .RB(RB_odd1), .RC(RC_odd1), .Imm(Imm_odd1), .PCout(PCout), .RT(RT_odd1), .branchTaken(branchTaken), .regWrite(regwr_odd1), .lat(lat_odd1), .uid(uid_odd1));



	always_comb begin

		//RA_even_fw

		if ((RAaddr_even==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RA_even_fw=RT_even3;
		else if ((RAaddr_even==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RA_even_fw=RT_even4;
		else if ((RAaddr_even==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RA_even_fw=RT_odd4;
		else if ((RAaddr_even==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RA_even_fw=RT_even5;
		else if ((RAaddr_even==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RA_even_fw=RT_odd5;
		else if ((RAaddr_even==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RA_even_fw=RT_even6;
		else if ((RAaddr_even==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RA_even_fw=RT_odd6;
		else if ((RAaddr_even==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RA_even_fw=RT_even7;
		else if ((RAaddr_even==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RA_even_fw=RT_odd7;
		else
			RA_even_fw=RA_even;



		//RB_even_fw

		if ((RBaddr_even==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RB_even_fw=RT_even3;
		else if ((RBaddr_even==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RB_even_fw=RT_even4;
		else if ((RBaddr_even==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RB_even_fw=RT_odd4;
		else if ((RBaddr_even==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RB_even_fw=RT_even5;
		else if ((RBaddr_even==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RB_even_fw=RT_odd5;
		else if ((RBaddr_even==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RB_even_fw=RT_even6;
		else if ((RBaddr_even==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RB_even_fw=RT_odd6;
		else if ((RBaddr_even==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RB_even_fw=RT_even7;
		else if ((RBaddr_even==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RB_even_fw=RT_odd7;
		else
			RB_even_fw=RB_even;



		//RC_even_fw

		if ((RCaddr_even==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RC_even_fw=RT_even3;
		else if ((RCaddr_even==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RC_even_fw=RT_even4;
		else if ((RCaddr_even==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RC_even_fw=RT_odd4;
		else if ((RCaddr_even==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RC_even_fw=RT_even5;
		else if ((RCaddr_even==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RC_even_fw=RT_odd5;
		else if ((RCaddr_even==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RC_even_fw=RT_even6;
		else if ((RCaddr_even==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RC_even_fw=RT_odd6;
		else if ((RCaddr_even==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RC_even_fw=RT_even7;
		else if ((RCaddr_even==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RC_even_fw=RT_odd7;
		else
			RC_even_fw=RC_even;



		//RA_odd_fw

		if ((RAaddr_odd==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RA_odd_fw=RT_even3;
		else if ((RAaddr_odd==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RA_odd_fw=RT_even4;
		else if ((RAaddr_odd==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RA_odd_fw=RT_odd4;
		else if ((RAaddr_odd==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RA_odd_fw=RT_even5;
		else if ((RAaddr_odd==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RA_odd_fw=RT_odd5;
		else if ((RAaddr_odd==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RA_odd_fw=RT_even6;
		else if ((RAaddr_odd==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RA_odd_fw=RT_odd6;
		else if ((RAaddr_odd==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RA_odd_fw=RT_even7;
		else if ((RAaddr_odd==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RA_odd_fw=RT_odd7;
		else
			RA_odd_fw=RA_odd;



		//RB_odd_fw

		if ((RBaddr_odd==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RB_odd_fw=RT_even3;
		else if ((RBaddr_odd==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RB_odd_fw=RT_even4;
		else if ((RBaddr_odd==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RB_odd_fw=RT_odd4;
		else if ((RBaddr_odd==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RB_odd_fw=RT_even5;
		else if ((RBaddr_odd==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RB_odd_fw=RT_odd5;
		else if ((RBaddr_odd==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RB_odd_fw=RT_even6;
		else if ((RBaddr_odd==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RB_odd_fw=RT_odd6;
		else if ((RBaddr_odd==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RB_odd_fw=RT_even7;
		else if ((RBaddr_odd==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RB_odd_fw=RT_odd7;
		else
			RB_odd_fw=RB_odd;




		//RC_odd_fw

		if ((RCaddr_odd==RTaddr_even3) && regwr_even3==1 && lat_even3==3)
			RC_odd_fw=RT_even3;
		else if ((RCaddr_odd==RTaddr_even4) && regwr_even4==1 && lat_even4<5)
			RC_odd_fw=RT_even4;
		else if ((RCaddr_odd==RTaddr_odd4) && regwr_odd4==1 && lat_odd4<5)
			RC_odd_fw=RT_odd4;
		else if ((RCaddr_odd==RTaddr_even5) && regwr_even5==1 && lat_even5<6)
			RC_odd_fw=RT_even5;
		else if ((RCaddr_odd==RTaddr_odd5) && regwr_odd5==1 && lat_odd5<6)
			RC_odd_fw=RT_odd5;
		else if ((RCaddr_odd==RTaddr_even6) && regwr_even6==1 && lat_even6<7)
			RC_odd_fw=RT_even6;
		else if ((RCaddr_odd==RTaddr_odd6) && regwr_odd6==1 && lat_odd6<7)
			RC_odd_fw=RT_odd6;
		else if ((RCaddr_odd==RTaddr_even7) && regwr_even7==1 && lat_even7<8)
			RC_odd_fw=RT_even7;
		else if ((RCaddr_odd==RTaddr_odd7) && regwr_odd7==1 && lat_odd7<8)
			RC_odd_fw=RT_odd7;
		else
			RC_odd_fw=RC_odd;
	
	end


endmodule





//->regfile module

module regfile(clk, reset, RAaddr_even, RBaddr_even, RCaddr_even, RTaddr_even, RA_even, RB_even, RC_even, RT_even, regWrite_even, RAaddr_odd, RBaddr_odd, RCaddr_odd, RTaddr_odd, RA_odd, RB_odd, RC_odd, RT_odd, regWrite_odd);
	
	input clk, reset, regWrite_even, regWrite_odd;
	input [0:6] RAaddr_even, RBaddr_even, RCaddr_even, RAaddr_odd, RBaddr_odd, RCaddr_odd, RTaddr_even, RTaddr_odd;
	input [0:127] RT_even, RT_odd;
	output logic [0:127] RA_even, RB_even, RC_even, RA_odd, RB_odd, RC_odd;

	logic [0:127] [0:127] regf;
	
	
	always_comb begin
		if(reset) begin
			RA_even = 0;
			RB_even = 0;
			RC_even = 0;
			RA_odd = 0;
			RB_odd = 0;
			RC_odd = 0;
		end

		else begin
			RA_even = regf[RAaddr_even];
			RB_even = regf[RBaddr_even];
			RC_even = regf[RCaddr_even];
			RA_odd = regf[RAaddr_odd];
			RB_odd = regf[RBaddr_odd];
			RC_odd = regf[RCaddr_odd];
		end
	end



	always_ff @(posedge clk) begin
		if(reset) begin
			for(int i=0; i<128; i++)
				regf[i] <= i;
		end

		else begin
			if (regWrite_even)
				regf[RTaddr_even] <= RT_even;
			if (regWrite_odd)
				regf[RTaddr_odd] <= RT_odd;
		end
	end


endmodule





//-> evenpipe module

module evenpipe(clk, reset, op, RA, RB, RC, Imm, RT, regWrite, lat, uid);

	
	input clk, reset;
	input [0:6] op;
	input [0:127] RA, RB, RC;
	input [0:17] Imm;

	output logic [0:127] RT;
	output logic regWrite;
	output logic [0:3] lat;
	output logic [0:2] uid;


	logic [0:32] temp_33;
	logic [0:31] temp_32;
	logic [0:15] temp_16;
	logic [0:7] temp_8;
	logic [0:4] shift_5;
	logic [0:5] shift_6;
	logic [0:3] shift_4;		
	logic [0:5] count;

	shortreal value_float, RA_float, RB_float, RC_float;
	logic [0:31] SMAX = 32'h7FFFFFFF;
	shortreal smax_float= $bitstoshortreal({SMAX[0], SMAX[1+:8], SMAX[9+:23]});
	logic [0:31] SMIN = 32'h00800000;
	shortreal smin_float= $bitstoshortreal({SMIN[0], SMIN[1+:8], SMIN[9+:23]});


	always_comb begin

		if (op>0 && op<43) begin
			uid = 1;
			lat = 3;
		end
		if (op>42 && op<51) begin
			uid = 2;
			lat = 4;
		end
		if (op>50 && op<55) begin
			uid = 3;
			lat = 7;
		end
		if (op>54 && op<59) begin
			uid = 3;
			lat = 8;
		end
		if (op>58 && op<63) begin
			uid = 4;
			lat = 4;
		end


		if (op>0 && op<63)
			regWrite = 1;
		else
			regWrite = 0;




		case(op)

			//Add Halfword
			1:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RA[i*16+: 16] + RB[i*16+: 16];
			end

			//Add Halfword Immediate
			2:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RA[i*16+: 16] + {{6{Imm[8]}},Imm[8:17]};;
			end

			//Add Word
			3:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] + RB[i*32+: 32];
			end


			//Add word Immediate
			4:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] + {{22{Imm[8]}},Imm[8:17]};
			end

			//Carry Generate
			5:begin
					for ( int i = 0; i < 4; i++ ) begin
						temp_33 = {1'b0, RA[32*i+:32]} +{1'b0, RB[32*i+:32]};
						RT[32*i+:32]= {31'b0,temp_33[0]};
					end
			end

			//Add extended
			6:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] + RB[i*32+: 32] + RT [32*(i+1)-1];
			end

			//Borrow Generate
			7:begin
					for ( int i = 0; i < 4; i++ )
						RT[32*i+:32] = (RB[32*i+:32] >= RA[32*i+:32])? {31'b0,1'b1}: {31'b0,1'b0};
			end

			//Subtract from extended
			8:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RB[i*32+: 32] + (~RA[i*32+: 32]) + RT [32*(i+1)-1];
			end

			//Subtract from Halfword
			9:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RB[i*16+: 16] + (~RA[i*16+: 16] + 1);
			end

			//Subtract from Halfword Immediate
			10:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = {{6{Imm[8]}},Imm[8:17]} + (~RA[i*16+: 16] + 1);
			end

			//Subtract from Word
			11:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RB[i*32+: 32] + (~RA[i*32+: 32] + 1);
			end

			//Subtract from Word Immediate
			12:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = {{22{Imm[8]}},Imm[8:17]} + (~RA[i*32+: 32] + 1);
			end

			//And
			13:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] & RB[i*32+: 32];
			end

			//And with Complement
			14:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] & (~RB[i*32+: 32]);
			end

			//And Halfword Immediate
			15:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RA[i*16+: 16] & {{6{Imm[8]}},Imm[8:17]};
			end

			//And Word Immediate
			16:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] & {{22{Imm[8]}},Imm[8:17]};
			end

			//Nand
			17:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = ~(RA[i*32+: 32] & RB[i*32+: 32]);
			end

			//Nor
			18:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = ~(RA[i*32+: 32] | RB[i*32+: 32]);
			end

			//Or
			19:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] | RB[i*32+: 32];
			end

			//Or with Complement
			20:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] | (~RB[i*32+: 32]);
			end

			//Or Halfword Immediate
			21:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RA[i*16+: 16] | {{6{Imm[8]}},Imm[8:17]};
			end

			//Or Word Immediate
			22:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] | {{22{Imm[8]}},Imm[8:17]};
			end

			//Exclusive Or
			23:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] ^ RB[i*32+: 32];
			end

			//Exclusive Or Halfword Immediate
			24:begin
			for(int i=0; i<8; i++)
				RT[i*16+: 16] = RA[i*16+: 16] ^ {{6{Imm[8]}},Imm[8:17]};
			end

			//Exclusive Or Word Immediate
			25:begin
			for(int i=0; i<4; i++)
				RT[i*32+: 32] = RA[i*32+: 32] ^ {{22{Imm[8]}},Imm[8:17]};
			end

			//Compare Logical Greater Than Halfword
			26:begin
				for ( int i = 0; i < 8; i++ ) begin
					if (RA[16*i+:16] > RA[16*i+:16])
						RT[16*i+:16]=16'hFFFF;
					else
						RT[16*i+:16]=16'h0000;
				end
			end

			//Compare Logical Greater Than Halfword Immediate
			27:begin
					for ( int i = 0; i < 8; i++ ) begin
						if (RA[16*i+:16] > {{6{Imm[8]}},Imm[8:17]})
							RT[16*i+:16]=16'hFFFF;
						else
						 	RT[16*i+:16]=16'h0000;
					end
			end

			//Compare Logical Greater Than Word
			28:begin
					for ( int i = 0; i < 4; i++ ) begin
						if (RA[32*i+:32] > RB[32*i+:32])
							RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Compare Logical Greater Than Word Immediate
			29:begin
					for ( int i = 0; i < 4; i++ ) begin
						if (RA[32*i+:32] > {{22{Imm[8]}},Imm[8:17]})
					    	RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Count Leading Zeros
			30:begin
					for ( int i = 0; i < 4; i++ ) begin
					  	count = 0;
					  	temp_32 = RA[32*i+:32];
						for (int m = 0; m < 32; m++ ) begin
							if (temp_32[m]) 
								break;
							else
								count = count +1;
						end
					  	RT[32*i+:32] = count;
					end
			end

			//Select Bits
			31:begin
				RT[0:127] = (RC[0:127] & RB[0:127]) | ((~ RC[0:127]) & RA[0:127]);
			end

			//Compare Greater Than Halfword
			32:begin
				for ( int i = 0; i < 8; i++ ) begin
						if ($signed(RA[16*i+:16]) > $signed(RB[16*i+:16]))
							RT[16*i+:16]=16'hFFFF;
						else
							RT[16*i+:16]=16'h0000;
				end
			end

			//Compare Greater Than Halfword Immediate
			33:begin
					for ( int i = 0; i < 8; i++ ) begin 
						if ($signed(RA[16*i+:16]) > $signed({{6{Imm[8]}},Imm[8:17]}))
							RT[16*i+:16]=16'hFFFF;
						else
							RT[16*i+:16]=16'h0000;
					end
			end

			//Compare Greater Than Word
			34:begin
					for ( int i = 0; i < 4; i++ ) begin 
						if ($signed(RA[32*i+:32]) > $signed(RB[32*i+:32]))
							RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Compare Greater Than Word Immediate
			35:begin
					for ( int i = 0; i < 4; i++ ) begin
						if ($signed(RA[32*i+:32]) > $signed({{22{Imm[8]}},Imm[8:17]}))
							RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Compare Equal Halfword
			36:begin
					for ( int i = 0; i < 8; i++ ) begin
						if (RA[16*i+:16] == RB[16*i+:16])
							RT[16*i+:16]=16'hFFFF;
						else
							RT[16*i+:16]=16'h0000;
					end
			end

			//Compare Equal Halfword Immediate
			37:begin
					for ( int i = 0; i < 8; i++ ) begin
						if (RA[16*i+:16] == {{6{Imm[8]}},Imm[8:17]})
						 	RT[16*i+:16]=16'hFFFF;
						else
							RT[16*i+:16]=16'h0000;
					end
			end

			//Compare Equal Word
			38:begin
					for ( int i = 0; i < 4; i++ ) begin
						if (RA[32*i+:32] == RB[32*i+:32])
							RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Compare Equal Word Immediate
			39:begin
					for ( int i = 0; i < 4; i++ ) begin
						if (RA[32*i+:32] == {{22{Imm[8]}},Imm[8:17]})
							RT[32*i+:32]=32'hFFFFFFFF;
						else 
							RT[32*i+:32]=32'h00000000;
					end
			end

			//Immediate Load Halfword
			40:begin
					for (int j =0; j < 8; j++)
						RT[16*j+:16] = Imm[2:17];
			end

			//Immediate Load Word
			41:begin
					for (int j =0; j < 4; j++)
						RT[32*j+:32] = {{16{Imm[2]}},Imm[2:17]};
			end

			//Immediate Load Address
			42:begin
					for (int j =0; j < 4; j++)
						RT[32*j+:32] = {14'd0,Imm};
			end

			//Shift Left Halfword
			43:begin
				for (int i = 0; i < 8; i++ ) begin
					temp_16 = RA[16*i+:16];
					shift_5 = RB[(16*i+11)+:5];
					for (int m = 0; m < 16; m++) begin
						if ((m + shift_5)<16)
							RT[16*i + m] = temp_16[m + shift_5];
						else 
						    RT[16*i + m] = 1'b0;
					end
				end
			end

			//Shift Left Halfword Immediate
			44:begin
					shift_5 = Imm[13:17];
					for (int i = 0; i < 8; i++ ) begin
						temp_16 = RA[16*i+:16];
						for (int m = 0; m < 16; m++) begin
							if ((m + shift_5)<16)
								RT[16*i + m] = temp_16[m + shift_5];
						   	else 
						   		RT[16*i + m] = 1'b0;
						end
					end
			end

			//Shift Left Word
			45:begin
					for (int i = 0; i < 4; i++ ) begin
						temp_32 = RA[32*i+:32];
						shift_6 = RB[(32*i+26)+:6];
						for (int m = 0; m < 32; m++) begin
							if ((m + shift_6)<32)
								RT[32*i + m] = temp_32[m + shift_6];
							else 
								RT[32*i + m] = 1'b0;
						end
					end
			end

			//Shift Left Word Immediate
			46:begin
					shift_6 = Imm[12:17];
					for (int i = 0; i < 4; i++ ) begin
						temp_32 = RA[32*i+:32];
					  	for (int m = 0; m < 32; m++) begin
						   	if ((m + shift_6)<32)
								RT[32*i + m] = temp_32[m + shift_6];
						   	else 
						    	RT[32*i + m] = 1'b0;
						  	end
					end
			end

			//Rotate Halfword
			47:begin
					for (int i = 0; i < 8; i++ ) begin
						temp_16 = RA[16*i+:16];
						shift_4 = RB[(16*i+12)+:4];
							for (int m = 0; m < 16; m++) begin
								if ((m + shift_4)<16)
									RT[16*i + m] = temp_16[m + shift_4];
							   	else 
							    	RT[16*i + m] = temp_16[m + shift_4 - 16];
							end
					end
			end

			//Rotate Halfword Immediate
			48:begin
					shift_4 = Imm[14:17];
					for (int i = 0; i < 8; i++ ) begin
						temp_16 = RA[16*i+:16];
						for (int m = 0; m < 16; m++) begin
							if ((m + shift_4)<16)
								RT[16*i + m] = temp_16[m + shift_4];
							else 
							    RT[16*i + m] = temp_16[m + shift_4 - 16];
						end
					end
			end

			//Rotate Word
			49:begin
					for (int i = 0; i < 4; i++ ) begin
						temp_32 = RA[32*i+:32];
						shift_5 = RB[(32*i+27)+:5];
						for (int m = 0; m < 32; m++) begin
							if ((m + shift_5)<32)
								RT[32*i + m] = temp_32[m + shift_5];
							else 
							    RT[32*i + m] = temp_32[m + shift_5 - 32];
						end
					end
			end

			//Rotate Word Immediate
			50:begin
					shift_5 = Imm[13:17];
					for (int i = 0; i < 4; i++ ) begin
						temp_32 = RA[32*i+:32];
						for (int m = 0; m < 32; m++) begin
							if ((m + shift_5)<32)
								RT[32*i + m] = temp_32[m + shift_5];
							else 
							    RT[32*i + m] = temp_32[m + shift_5 - 32];
						end
					end
			end

			//Floating Multiply
			51:begin
					for (int i = 0; i < 4; i++ ) begin
						 RA_float = $bitstoshortreal({RA[32*i], RA[((32*i)+1)+:8], RA[((32*i)+9)+:23]});
						 RB_float = $bitstoshortreal({RB[32*i], RB[((32*i)+1)+:8], RB[((32*i)+9)+:23]});
						 value_float = RA_float * RB_float;
						 if (value_float>smax_float)
				           {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(smax_float);
						 else if(value_float<(-smax_float))
				           {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(-smax_float);
						 else if((value_float > -smin_float)&&(value_float< smin_float))
				           RT[32*i+:32] = 32'b0;
						 else
						 {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(value_float); 
					end
			end

			//Floating Multiply and Add
			52:begin
				for (int i = 0; i < 4; i++ ) begin 
					 RA_float = $bitstoshortreal({RA[32*i], RA[((32*i)+1)+:8], RA[((32*i)+9)+:23]});
					 RB_float = $bitstoshortreal({RB[32*i], RB[((32*i)+1)+:8], RB[((32*i)+9)+:23]});
					 RC_float = $bitstoshortreal({RC[32*i], RC[((32*i)+1)+:8], RC[((32*i)+9)+:23]});
					 value_float = (RA_float * RB_float) + RC_float;
					 if (value_float>smax_float)
				       {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(smax_float);
					 else if(value_float<(-smax_float))
				       {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(-smax_float);
					 else if((value_float > -smin_float)&&(value_float< smin_float))
				       RT[32*i+:32] = 32'b0;
					 else
					 {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(value_float);
					end
			end

			//Floating Multiply and Subtract
			53:begin
					for (int i = 0; i < 4; i++ ) begin
						 RA_float = $bitstoshortreal({RA[32*i], RA[((32*i)+1)+:8], RA[((32*i)+9)+:23]});
						 RB_float = $bitstoshortreal({RB[32*i], RB[((32*i)+1)+:8], RB[((32*i)+9)+:23]});
						 RC_float = $bitstoshortreal({RC[32*i], RC[((32*i)+1)+:8], RC[((32*i)+9)+:23]});
						 value_float = (RA_float * RB_float) - RC_float;
						 if (value_float>smax_float)
			               {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(smax_float);
						 else if(value_float<(-smax_float))
			               {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(-smax_float);
						 else if((value_float > -smin_float)&&(value_float< smin_float))
			               RT[32*i+:32] = 32'b0;
			    		 else
						 {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(value_float);
					end
			end

			//Floating Add
			54:begin
					for (int i = 0; i < 4; i++ ) begin 
						 RA_float = $bitstoshortreal({RA[32*i], RA[((32*i)+1)+:8], RA[((32*i)+9)+:23]});
						 RB_float = $bitstoshortreal({RB[32*i], RB[((32*i)+1)+:8], RB[((32*i)+9)+:23]});
						 value_float = RA_float + RB_float;
						 if (value_float>smax_float)
			               {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(smax_float);
						 else if(value_float<(-smax_float))
			               {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(-smax_float);
						 else if((value_float > -smin_float)&&(value_float< smin_float))
			               RT[32*i+:32] = 32'b0;
			    		 else
						 {RT[32*i], RT[((32*i)+1)+:8], RT[((32*i)+9)+:23]} =$shortrealtobits(value_float); 
					end
			end

			//Multiply and Add
			55:begin
				for ( int i = 0; i < 4; i++ )
						RT[32*i+:32] = ( $signed(RA[(16*(2*i+1))+:16]) * $signed(RB[(16*(2*i+1))+:16]) ) + RC[32*i+:32];
			end

			//Multiply
			56:begin
				for ( int i = 0; i < 4; i++ ) 	
					RT[32*i+:32] = $signed(RA[(16*(2*i+1))+:16]) * $signed(RB[(16*(2*i+1))+:16]);
			end

			//Multiply Immediate
			57:begin
				for ( int i = 0; i < 4; i++ ) 
					RT[32*i+:32] = $signed(RA[(16*(2*i+1))+:16]) * $signed({{6{Imm[8]}},Imm[8:17]});
			end

			//Multiply Unsigned
			58:begin
				for ( int i = 0; i < 4; i++ )
					RT[32*i+:32] = RA[(16*(2*i+1))+:16] * RB[(16*(2*i+1))+:16];
			end

			//Count Ones in Bytes
			59:begin
					for (int i = 0; i < 16; i++ ) begin
						count = 0;
						temp_8 = RA[8*i+:8];
						for (int m = 0; m < 8; m++ ) 
							count=temp_8[m]?count+1:count;
						RT[8*i+:8] = count;
					end
			end

			//Absolute Differences of Bytes
			60:begin
				for(int j=0; j<16; j++) begin
					if(RB[8*j+:8] > RA[8*j+:8])
						RT[8*j+:8] = RB[8*j+:8]-RA[8*j+:8];
					else
						RT[8*j+:8] = RA[8*j+:8]-RB[8*j+:8];
				end
			end

			//Average Bytes
			61:begin
				for(int j=0; j<127; j++)
					RT[8*j+:8] = ({1'b0,RA[j*8+:8]} + {1'b0,RB[j*8+:8]} + 1) >>1;
			end

			//Sum Bytes into Halfwords
			62:begin
				for (int i = 0; i < 4; i++) begin 
					RT[32*i+:16] = RB[32*i+:8] + RB[8*(4*i+1)+:8] + RB[8*(4*i+2)+:8] + RB[8*(4*i+3)+:8]; 
					RT[(32*i+16)+:16] = RA[32*i+:8] + RA[8*(4*i+1)+:8] + RA[8*(4*i+2)+:8] + RA[8*(4*i+3)+:8];
				end
			end

			85:begin	//No Operation (Execute)
			//regWrite is zero;
			end

			default: begin
			//do nothing
			end


		endcase
	end


endmodule






//->oddpipe module


module oddpipe(clk, reset, op, PCin, RA, RB, RC, Imm, PCout, RT, branchTaken, regWrite, lat, uid);


	input clk, reset;
	input [0:6] op;
	input [0:31] PCin;
	input [0:127] RA, RB, RC;
	input [0:17] Imm;

	output logic [0:31] PCout;
	output logic [0:127] RT;
	output logic branchTaken, regWrite;
	output logic [0:2] lat;
	output logic [0:2] uid; 

	parameter LSLR = 32'h00007FFF;


	logic [0:14] LSA;
	logic [0:32767][0:7]  LocStor;


	always_comb begin

		PCout = (PCin+4) & LSLR;
		branchTaken = 0;

		if (reset) begin
			for(int i=0; i<32768; i++)
				LocStor[i] = $urandom_range(1,10);
		end

		else begin
			if (op>62 && op<71) begin
				uid = 5;
				lat = 4;
			end
			if (op>70 && op<73) begin
				uid = 6;
				lat = 7;
			end
			if (op>72 && op<83) begin
				uid = 7;
				lat = 1;
			end
			if (op==84) begin
				uid = 0;
			end

			if ((op>62 && op<71) || (op==71 || op==75 || op==77 || op==79))
				regWrite=1;
			else
				regWrite=0;




			case(op)

				63: begin	//Shift Left Quadword by Bytes
						for(int i=0; i<16; i++) begin
							if(i+RB[27:31]<16)
								RT[8*i+:8] = RA[8*i+RB[27:31]];
							else
								RT[8*i+:8] = 0;
						end
					end


				64: begin	//Shift Left Quadword by Bytes Immediate
						for(int i=0; i<16; i++) begin
							if(i+Imm[13:17]<16)
								RT[8*i+:8] = RA[8*i+Imm[13:17]];
							else
								RT[8*i+:8] = 0;
						end
					end

				65: begin	//Shift Left Quadword by Bits
						for(int i=0; i<128; i++) begin
							if(i+RB[29:31]<128)
								RT[i] = RA[i+RB[29:31]];
							else
								RT[i] = 0;
						end
					end

				66: begin	//Shift Left Quadword by Bits Immediate
						for(int i=0; i<128; i++) begin
							if(i+Imm[15:17]<128)
								RT[i] = RA[i+Imm[15:17]];
							else
								RT[i] = 0;
						end
					end

				67: begin	//Rotate Quadword by Bytes
						for(int i=0; i<16; i++) begin
							if(i+RB[28:31]<16)
								RT[8*i+:8] = RA[8*i+RB[28:31]];
							else
								RT[8*i+:8] = RA[8*i+RB[28:31]-16];
						end
					end

				68: begin	//Rotate Quadword by Bytes Immediate
						for(int i=0; i<16; i++) begin
							if(i+Imm[14:17]<16)
								RT[8*i+:8] = RA[8*i+Imm[14:17]];
							else
								RT[8*i+:8] = RA[8*i+RB[14:17]-16];
						end
					end

				69: begin	//Rotate Quadword by Bits
						for(int i=0; i<128; i++) begin
							if(i+RB[29:31]<128)
								RT[i] = RA[i+RB[29:31]];
							else
								RT[i] = RA[i+RB[29:31]-128];
						end
					end

				70: begin	//Rotate Quadword by Bits Immediate
						for(int i=0; i<128; i++) begin
							if(i+Imm[15:17]<128)
								RT[i] = RA[i+Imm[15:17]];
							else
								RT[i] = RA[i+Imm[15:17]-128];
						end
					end

				71: begin	//Load Quadword (a-form)
						LSA = {{14{Imm[2]}},Imm[2:17], 2'b00} & LSLR & 32'hFFFFFFF0; 
								for (int j=0; j<16; j++)
									RT[8*j+:8] = LocStor[LSA+j];
					end

				72: begin	//Store Quadword (a-form)
						LSA = {{14{Imm[2]}},Imm[2:17], 2'b00} & LSLR & 32'hFFFFFFF0;
								for (int j=0; j<16; j++)
									LocStor[LSA+j] = RA[8*j+:8];
					end

				73: begin	//Branch Indirect
						PCout = RA[0:31] & LSLR & 32'hFFFFFFFC;
						branchTaken = 1;
					end

				74: begin	//Branch Indirect If Zero
						if (RA[0:31] == 0) begin
							PCout = RA[0:31] & LSLR & 32'hFFFFFFFC;
							branchTaken=1;
						end
						else begin
							PCout = (PCin+4) & LSLR;
							branchTaken=0;
						end
					end

				75: begin	//Branch Indirect and Set Link
						branchTaken=1;
						RT[0:31] = LSLR & (PCin+4);
						RT[32:127] = 0;
						PCout = RA[0:31] & LSLR & 32'hFFFFFFFC;
					end

				76: begin	//Branch Absolute
						branchTaken=1;
						PCout = {{14{Imm[2]}},Imm[2:17], 2'b00} & LSLR;
					end

				77: begin	//Branch Absolute and Set Link
						branchTaken=1;
						RT[0:31] = (PCin+4) & LSLR;
						RT[32:127] = 0;
						PCout = {{14{Imm[2]}},Imm[2:17], 2'b00} & LSLR;
					end

				78: begin	//Branch Relative
						branchTaken = 1;
						PCout = (PCin + {{14{Imm[2]}},Imm[2:17], 2'b00}) & LSLR;
					end

				79: begin	//Branch Relative and Set Link
						branchTaken = 1;
						RT[0:31] = (PCin+4) & LSLR;
						RT[32:127] = 0;
						PCout = (PCin + {{14{Imm[2]}},Imm[2:17], 2'b00}) & LSLR;
					end

				80: begin	//Branch If Zero Word
						if (RT[0:31] == 0) begin
							branchTaken = 1;
							PCout = (PCin + {{14{Imm[2]}},Imm[2:17], 2'b00}) & LSLR & 32'hFFFFFFFC;
						end
						else begin
							branchTaken=0;
							PCout = (PCin + 4) & LSLR;
						end
					end

				81: begin	//Branch If Not Zero Word
						if (RT[0:31] != 0) begin
							branchTaken = 1;
							PCout = (PCin + {{14{Imm[2]}},Imm[2:17], 2'b00}) & LSLR & 32'hFFFFFFFC;
						end
						else begin
							branchTaken=0;
							PCout = (PCin + 4) & LSLR;
						end
					end

				82: begin	//Branch If Zero Halfword
						if (RT[16:31] != 0) begin
							branchTaken = 1;
							PCout = (PCin + {{14{Imm[2]}},Imm[2:17], 2'b00}) & LSLR & 32'hFFFFFFFC;
						end
						else begin
							branchTaken=0;
							PCout = (PCin + 4) & LSLR;
						end
					end

				83: begin	//Stop and Signal
						PCout = (PCin+4) & LSLR;
						$stop;
					end

				84: begin	//No Operation (Execute)
					//regWrite is 0;
					end

				default: begin
				//do nothing
				end

			
			endcase
			
		end
	end



endmodule




