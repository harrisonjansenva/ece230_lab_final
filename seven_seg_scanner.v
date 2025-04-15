module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire [1:0] state;
    
  dff dff0 (
        .reset(reset),
        .clock(div_clock),
        .D(~state[0]),
        .Q(state[0]),
        .NotQ()
    );
    dff dff1( 
        .reset(reset),
        .clock(div_clock),
        .D(state[1] ^ state[0]),
        .Q(state[1]),
        .NotQ()
    );


    // The state machine is a simple 2-bit counter that counts from 0 to 3
    // (00, 01, 10, 11) and then resets to 0. This will be used to control the
    // anodes of the seven segment displays.
  

// This block should activate one anode at a time in the seven segment
    // displays. Keep in mind THEY ARE INVERSE DRIVE, that is that 0 is on 1 is
    // off. Think of it as a state machine.

    // The reset line should set things back to segment 0

    // Use the D FlipFlops from previous labs, and implement all other logic
    // purely combinatorial.

    // Anodes are:
    // 0: R Right
    // 1: RC Right Center
    // 2: LC Left Center
    // 3: L Left
    
    assign anode[0] = state[1] | state[0];
    assign anode[1] = state[1] | ~state[0];
    assign anode[2] = ~state[1] | state[0];
    assign anode[3] = ~state[1] | ~state[0];

endmodule
