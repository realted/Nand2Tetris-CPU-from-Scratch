-- This file is part of www.nand2tetris.org
-- *WIP - all function with the exception of jump instruction "101"

--The Hack Central Processing unit (CPU).
--Parses the binary code in the instruction input and executes it according to the
--Hack machine language specification. In the case of a C-instruction, computes the
--function specified by the instruction. If the instruction specifies to read a memory
--value, the inM input is expected to contain this value. If the instruction specifies
 -- to write a value to the memory, sets the outM output to this value, sets the addressM
 -- output to the target address, and asserts the writeM output (when writeM = 0, any
 -- value may appear in outM).
 -- If the reset input is 0, computes the address of the next instruction and sets the
 -- pc output to that value. If the reset input is 1, sets pc to 0.
 -- Note: The outM and writeM outputs are combinational: they are affected by the
 -- instruction's execution during the current cycle. The addressM and pc outputs are
 -- clocked: although they are affected by the instruction's execution, they commit to
 -- their new values only in the next cycle.
 
CHIP CPU {

    IN  inM[16],         // M value input  (M = contents of RAM[A])
        instruction[16], // Instruction for execution
        reset;           // Signals whether to re-start the current
                         // program (reset==1) or continue executing
                         // the current program (reset==0).

    OUT outM[16],        // M value output
        writeM,          // Write to M? 
        addressM[15],    // Address in data memory (of M)
        pc[15];          // address of next instruction

    PARTS:
	
    Mux16(a= instruction, b= ALUout, sel= instruction[15], out= Areg);
    Not(in= instruction[15], out= msbNot);
    Mux(a= msbNot, b= instruction[5], sel= instruction[15], out= Aload);
    ARegister(in= Areg, load= Aload, out= Aout, out[0..14] = addressM);
    Mux16(a= Aout, b= inM, sel= instruction[12], out= ALUin2);
    And(a=instruction[4] , b= instruction[15], out= Dload);
    DRegister(in= ALUout, load= Dload, out= ALUin1);
    ALU(x= ALUin1, y= ALUin2, zx= instruction[11], nx= instruction[10], zy= instruction[9], ny= instruction[8], f= instruction[7], no= instruction[6], out= ALUout, out = outM, zr= zr, ng= ng);
    And(a= instruction[3], b= instruction[15], out= writeM);
    //DMux8Way(in= zr, sel= instruction[0..2], a= z1, b= z2, c= z3, d= z4, e= z5, f= z6, g= z7, h= z8);
    //DMux8Way(in= ng, sel= instruction[0..2], a= n1, b= n2, c= n3, d= n4, e= n5, f= n6, g= n7, h= n8);
    // Case 1 
    Or(a= zr, b= ng, out= on1);
    Not(in= on1, out= o1);
    And(a= o1, b= instruction[0], out= j1);
    // Case 2
    Not(in= ng, out= notng);
    And(a= zr, b= notng, out= o2);
    And(a= o2, b= instruction[1], out= j2);
    // Case 3
    Not(in= zr, out= notzr);
    And(a= notzr, b= ng, out= o3);
    And(a= o3, b= instruction[2], out= j3);
    // Case 4
    And(a = zr, b = ng, out= o41);
    And(a= o41, b= instruction[0], out= o42);
    And(a= o42, b= instruction[1], out= o43);
    And(a= o43, b= instruction[2], out= j4);
    // Or Cases
    Or(a= j1, b= j2, out= j11);
    Or(a= j3, b= j4, out= j12);
    Or(a= j11, b= j12, out= ld);

    //unconditional?
    //And(a= instruction[0], b= instruction[1], out= u1);
    //And(a= instruction[2], b= u1, out= jmp);
    //Not(in= jmp, out= notjmp);
    //And(a= ldif, b= notjmp, out= ld);

    PC(in= Aout, load= ld, inc= up, reset= reset, out[0..14]= pc);

    //inc no matter what
    Or(a= zr, b= notzr, out= up);
    

}