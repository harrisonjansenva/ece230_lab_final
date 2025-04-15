module clock_div
#( parameter DIVIDE_BY = 17 )
(
    input clock,
    input reset,
    output div_clock
);

    wire[DIVIDE_BY-1:0] q;
    genvar i;

    dff dff0(
        .reset(reset),
        .clock(clock),
        .D(~q[0]),
        .Q(q[0]),
        .NotQ()
    ); 

    generate
        for (i = 1; i < DIVIDE_BY; i = i + 1) begin: dff_gen
            dff dff_i(
                .reset(reset),
                .clock(q[i-1]),
                .D(~q[i]),
                .Q(q[i]),
                .NotQ()
            );
        end
    endgenerate

    assign div_clock = q[DIVIDE_BY-1];
    // The last flip-flop's output is the divided clock 



endmodule
