module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);

    wire [3:0] Sum;
    wire [3:0] Diff;

    // Instantiate the full adder for addition
    full_adder adder (
        .A(A),
        .B(B),
        .Cin(1'b0), // No carry in for addition
        .Sum(Sum),
        .Cout()
    );

    // Instantiate the full adder for subtraction
    full_adder subtractor (
        .A(A),
        .B(~B), // Two's complement for subtraction
        .Cin(1'b1), // Carry in for subtraction
        .Sum(Diff),
        .Cout()
    );

    assign AplusB = Sum;
    assign AminusB = Diff;





endmodule