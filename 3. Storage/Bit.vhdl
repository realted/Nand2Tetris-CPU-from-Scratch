-- This file is part of www.nand2tetris.org

-- 1-bit register:
-- If load is asserted, the register's value is set to in;
-- Otherwise, the register maintains its current value:
-- if (load(t)) out(t+1) = in(t), else out(t+1) = out(t)

CHIP Bit {
    IN in, load;
    OUT out;

    PARTS:
    Mux(a= Q, b= in, sel= load, out= d);
    DFF(in = d, out = out, out = Q);
    }