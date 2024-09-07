CHIP And {
    IN a, b;
    OUT out;
    
    PARTS:
    Nand(a=a, b=b, out=c1);
    Not(in = c1, out = out);
}