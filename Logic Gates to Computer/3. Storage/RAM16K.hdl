CHIP RAM16K {
    IN in[16], load, address[14];
    OUT out[16];

    PARTS:
    DMux4Way(in= load, sel= address[12..13], a= ad1, b= ad2, c= ad3, d= ad4);
    RAM4K(in= Q, load= ad1, address= address[0..11], out= d1);
    RAM4K(in= Q, load= ad2, address= address[0..11], out= d2);
    RAM4K(in= Q, load= ad3, address= address[0..11], out= d3);
    RAM4K(in= Q, load= ad4, address= address[0..11], out= d4);
    Mux4Way16(a= d1, b= d2, c= d3, d= d4, sel= address[12..13], out= out, out = dout);
    Mux16(a= dout, b= in, sel= load, out= Q);
}