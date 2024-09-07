CHIP RAM8 {
    IN in[16], load, address[3];
    OUT out[16];

    PARTS:
    Mux16(a= Q, b= in, sel= load, out= data);
    DMux8Way(in= load, sel= address, a= a1, b= b1, c= c1, d= d1, e= e1, f= f1, g= g1, h= h1);
    Register(in= data, load= a1, out= out1);
    Register(in= data, load= b1, out= out2);
    Register(in= data, load= c1, out= out3);
    Register(in= data, load= d1, out= out4);
    Register(in= data, load= e1, out= out5);
    Register(in= data, load= f1, out= out6);
    Register(in= data, load= g1, out= out7);
    Register(in= data, load= h1, out= out8);
    Mux8Way16(a= out1, b= out2, c= out3, d= out4, e= out5, f= out6, g= out7, h= out8, sel= address, out= out, out = Q);

}