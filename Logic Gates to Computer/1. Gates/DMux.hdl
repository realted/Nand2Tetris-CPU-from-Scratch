CHIP DMux {
    IN in, sel;
    OUT a, b;

    PARTS:
    Not(in = sel, out = selNot);
    And(a= in, b=selNot , out= a);
    And(a= sel, b=in , out= b);
}