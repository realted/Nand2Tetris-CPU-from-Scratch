CHIP Or {
    IN a, b;
    OUT out;

    PARTS:
    Not(in= a, out= a1);
    Not(in= b, out= b1);
    And(a= a1, b= b1, out= c1);
    Not(in= c1, out= out);
}