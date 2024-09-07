CHIP Mux {
    IN a, b, sel;
    OUT out;

    PARTS:
    Not(in= sel, out= selNot);
    And(a= a, b= selNot, out= c1);
    And(a= b, b= sel, out= c2);
    Or(a= c1, b= c2, out= out);
}