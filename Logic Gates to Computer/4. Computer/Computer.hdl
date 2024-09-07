CHIP Computer {

    IN reset;

    PARTS:
    CPU(inM= memout, instruction= romout, reset= reset, outM= oM, writeM= wM, addressM= aM, pc= pcout);
    Memory(in= oM, load= wM, address= aM, out= memout);
    ROM32K(address= pcout, out= romout);
}