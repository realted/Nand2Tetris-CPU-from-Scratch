CHIP DMux4Way {
    IN in, sel[2];
    OUT a, b, c, d;

    PARTS:
    DMux(in= in, sel= sel[1], a= c1, b= c2);
    DMux(in= c1, sel= sel[0], a= a, b= b);
    DMux(in= c2, sel= sel[0], a= c, b= d);
}