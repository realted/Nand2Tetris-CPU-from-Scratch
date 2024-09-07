CHIP RAM64 {
    IN in[16], load, address[6];
    OUT out[16];

    PARTS:
    DMux8Way(in= load, sel= address[3..5], a= ad1, b= ad2, c= ad3, d= ad4, e= ad5, f= ad6, g= ad7, h= ad8);
    RAM8(in= Q, load= ad1, address= address[0..2], out= d1);
    RAM8(in= Q, load= ad2, address= address[0..2], out= d2);
    RAM8(in= Q, load= ad3, address= address[0..2], out= d3);
    RAM8(in= Q, load= ad4, address= address[0..2], out= d4);
    RAM8(in= Q, load= ad5, address= address[0..2], out= d5);
    RAM8(in= Q, load= ad6, address= address[0..2], out= d6);
    RAM8(in= Q, load= ad7, address= address[0..2], out= d7);
    RAM8(in= Q, load= ad8, address= address[0..2], out= d8);
    Mux8Way16(a= d1, b= d2, c= d3, d= d4, e= d5, f= d6, g= d7, h= d8, sel= address[3..5], out= out, out = dout);
    Mux16(a= dout, b= in, sel= load, out= Q);

}