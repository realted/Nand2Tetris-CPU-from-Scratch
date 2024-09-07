// This file is part of www.nand2tetris.org
/**
 * A 16-bit counter.
 * if      reset(t): out(t+1) = 0
 * else if load(t):  out(t+1) = in(t)
 * else if inc(t):   out(t+1) = out(t) + 1
 * else              out(t+1) = out(t)
 */
CHIP PC {
    IN in[16], reset, load, inc;
    OUT out[16];
    
    PARTS:
    Not16(in= in, out= rev);
    And16(a= in, b= rev, out= zr);
    Not(in= load, out= loadnot);
    Or(a = load, b = loadnot, out = one);
    Register(in= D, load= one, out= Q, out = out);
    Inc16(in= Q, out= Qpp);
    Mux8Way16(a= Q, b= zr, c= in, d= zr, e= Qpp, f= zr, g= in, h= zr, sel[2]= inc, sel[1] = load, sel[0] = reset, out= D);
}