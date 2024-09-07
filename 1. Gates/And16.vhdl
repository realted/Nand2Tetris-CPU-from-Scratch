CHIP And16 {
    IN a[16], b[16];
    OUT out[16];

    PARTS:
    Nand16(a = a, b = b, out= c1);
    Not16(in= c1, out= out);
}
