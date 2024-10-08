-- This file is part of www.nand2tetris.org

-- ALU (Arithmetic Logic Unit):
-- Computes out = one of the following functions:
--                0, 1, -1,
--                x, y, !x, !y, -x, -y,
--                x + 1, y + 1, x - 1, y - 1,
--               x + y, x - y, y - x,
--                x & y, x | y
-- on the 16-bit inputs x, y,
-- according to the input bits zx, nx, zy, ny, f, no.
-- In addition, computes the two output bits:
-- if (out == 0) zr = 1, else zr = 0
-- if (out < 0)  ng = 1, else ng = 0

-- Implementation: Manipulates the x and y inputs
-- and operates on the resulting values, as follows:
-- if (zx == 1) sets x = 0        // 16-bit constant
-- if (nx == 1) sets x = !x       // bitwise not
-- if (zy == 1) sets y = 0        // 16-bit constant
-- if (ny == 1) sets y = !y       // bitwise not
-- if (f == 1)  sets out = x + y  // integer 2's complement addition
-- if (f == 0)  sets out = x & y  // bitwise and
-- if (no == 1) sets out = !out   // bitwise not


CHIP ALU {
    IN  
        x[16], y[16],  // 16-bit inputs        
        zx, // zero the x input?
        nx, // negate the x input?
        zy, // zero the y input?
        ny, // negate the y input?
        f,  // compute (out = x + y) or (out = x & y)?
        no; // negate the out output?
    OUT 
        out[16], // 16-bit output
        zr,      // if (out == 0) equals 1, else 0
        ng;      // if (out < 0)  equals 1, else 0

    PARTS:
    Not16(in = x[0..15], out = notx);
    Not16(in = y[0..15], out = noty);
    And16(a = notx, b = x, out = zerox);
    And16(a = noty, b = y, out = zeroy);
    Not16(in = zerox, out = d1);
    Not16(in = zeroy, out = d2);
    Mux4Way16(a= x, b= notx, c= zerox, d= d1, sel[0] = nx, sel[1] = zx, out= resx);
    Mux4Way16(a= y, b= noty, c= zeroy, d= d2, sel[0] = ny, sel[1] = zy, out= resy);
    And16(a= resx, b= resy, out= andxy);
    Add16(a= resx, b= resy, out= addxy);
    Mux16(a= andxy, b= addxy, sel= f, out= resxy);
    Not16(in= resxy, out= notres);
    Mux16(a= resxy, b= notres, sel= no, out= out, out[0..7] = reslsb, out[8..15] = resmsb, out[15] = ng);
    Or8Way(in= reslsb, out= resor1);
    Or8Way(in= resmsb, out= resor2);
    Or(a = resor1, b = resor2, out = or16);
    Not(in = or16, out = zr);
    
}