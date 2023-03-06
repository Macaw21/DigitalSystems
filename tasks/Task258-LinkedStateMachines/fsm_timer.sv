module fsm_timer #(parameter int unsigned N=256) (output logic READY, input logic CLK, START, RESET, N_RESET);

   typedef int unsigned state_t;

   state_t state;
   state_t next_state;
   
   //Next state logic
   always_comb begin : next_state_logic

      //Default - stay put
      next_state = state;

      //Update state - COMPLETE THIS
      case (state)
      0:       next_state = (START == 1) ? 1 : 0;     //First state - if start is 1, go to state 1, otherwise goto state 0
      (N-1):   next_state = (RESET == 1) ? 0 : N-1;   //End state - if reset is 1, goto state 0, otherwise, remain at current state
      default: next_state = (state + 1);       			//Intermediate states - got next state
      endcase
   end

   //Output logic -  COMPLETE THIS
   always_comb begin : output_logic
      case (state)
      (N-1): 	READY = '1;			//At state 255, set READY.
      default: READY = '0;			//READY set low for all states apart from 255.
      endcase
   end

   //Update state
   always_ff @(posedge CLK or negedge N_RESET) begin : update_state
   if(~N_RESET) 
      state <= 0;
   else
      state <= next_state;
   end


endmodule
