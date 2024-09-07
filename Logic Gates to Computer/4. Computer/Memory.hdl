CHIP Memory {
    IN in[16], load, address[15];
    OUT out[16];

    PARTS:
    DMux(in = load, sel= address[14], a= ram, b= ext);
    DMux(in= ext, sel= address[13], a= scr, b= kbd);
    RAM16K(in= in, load= ram, address= address[0..13], out= ramout);
    Screen(in= in, load= scr, address= address[0..12], out= scrnout);
    Keyboard(out= kbdout);
    Mux16(a= scrnout, b= kbdout, sel= address[13], out= extout);
    Mux16(a= ramout, b= extout, sel= address[14], out= out);

	
}