CHIP RAM4K {
    IN in[16], load, address[12];
    OUT out[16];

    PARTS:
    DMux8Way(in= load, sel= address[9..11], a= ad1, b= ad2, c= ad3, d= ad4, e= ad5, f= ad6, g= ad7, h= ad8);
    RAM512(in= Q, load= ad1, address= address[0..8], out= d1);
    RAM512(in= Q, load= ad2, address= address[0..8], out= d2);
    RAM512(in= Q, load= ad3, address= address[0..8], out= d3);
    RAM512(in= Q, load= ad4, address= address[0..8], out= d4);
    RAM512(in= Q, load= ad5, address= address[0..8], out= d5);
    RAM512(in= Q, load= ad6, address= address[0..8], out= d6);
    RAM512(in= Q, load= ad7, address= address[0..8], out= d7);
    RAM512(in= Q, load= ad8, address= address[0..8], out= d8);
    Mux8Way16(a= d1, b= d2, c= d3, d= d4, e= d5, f= d6, g= d7, h= d8, sel= address[9..11], out= out, out = dout);
    Mux16(a= dout, b= in, sel= load, out= Q);
}