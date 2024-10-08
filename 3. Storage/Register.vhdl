-- This file is part of www.nand2tetris.org
--
-- 16-bit register:
-- If load is asserted, the register's value is set to in;
-- Otherwise, the register maintains its current value:
-- if (load(t)) out(t+1) = int(t), else out(t+1) = out(t)

CHIP Register {
    IN in[16], load;
    OUT out[16];

    PARTS:
    Mux(a= Q0, b= in[0], sel= load, out = d0);
    DFF(in = d0, out = out[0], out = Q0);
    Mux(a= Q1, b= in[1], sel= load, out = d1);
    DFF(in = d1, out = out[1], out = Q1);
    Mux(a= Q2, b= in[2], sel= load, out= d2);
    DFF(in = d2, out = out[2], out = Q2);
    Mux(a= Q3, b= in[3], sel= load, out= d3);
    DFF(in = d3, out = out[3], out = Q3);
    Mux(a= Q4, b= in[4], sel= load, out= d4);
    DFF(in = d4, out = out[4], out = Q4);
    Mux(a= Q5, b= in[5], sel= load, out= d5);
    DFF(in = d5, out = out[5], out = Q5);
    Mux(a= Q6, b= in[6], sel= load, out= d6);
    DFF(in = d6, out = out[6], out = Q6);
    Mux(a= Q7, b= in[7], sel= load, out= d7);
    DFF(in = d7, out = out[7], out = Q7);
    Mux(a= Q8, b= in[8], sel= load, out = d8);
    DFF(in = d8, out = out[8], out = Q8);
    Mux(a= Q9, b= in[9], sel= load, out = d9);
    DFF(in = d9, out = out[9], out = Q9);
    Mux(a= Q10, b= in[10], sel= load, out= d10);
    DFF(in = d10, out = out[10], out = Q10);
    Mux(a= Q11, b= in[11], sel= load, out= d11);
    DFF(in = d11, out = out[11], out = Q11);
    Mux(a= Q12, b= in[12], sel= load, out= d12);
    DFF(in = d12, out = out[12], out = Q12);
    Mux(a= Q13, b= in[13], sel= load, out= d13);
    DFF(in = d13, out = out[13], out = Q13);
    Mux(a= Q14, b= in[14], sel= load, out= d14);
    DFF(in = d14, out = out[14], out = Q14);
    Mux(a= Q15, b= in[15], sel= load, out= d15);
    DFF(in = d15, out = out[15], out = Q15);
}