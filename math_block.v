module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

    wire [3:0] Sum;
    wire [3:0] Diff;

    
    full_adder adder (
        .A(A),
        .B(B),
        .Cin(1'b0), 
        .Sum(Sum),
        .Cout()
    );
    
    full_adder subtractor (
        .A(A),
        .B(~B), 
        .Cin(1'b1), 
        .Sum(Diff),
        .Cout()
    );

    assign AplusB = Sum;
    assign AminusB = Diff;





endmodule
