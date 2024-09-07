CHIP Or16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
    Not16(in= a, out= a1);
    Not16(in= b, out= b1);
    And16(a= a1, b= b1, out= c1);
    Not16(in= c1, out= out);
}