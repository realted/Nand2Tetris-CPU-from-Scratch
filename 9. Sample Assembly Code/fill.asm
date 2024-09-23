

*****
// Pseudocode

start = SCREEN
stop = KBD
i = 0

LOOP1:
	IF RAM[KBD] = 0:
	j LOOP1
	
	i = start
	LOOP2:
		IF i < stop:
			RAM[i] = -1
			i = i+1
			j LOOP2
		jLOOP1
		
		
		
		
*****

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// start = SCREEN, stop = KBD, i = 0
@SCREEN
D=A
@start
M=D
@KBD
D=A
@stop
M=D
@i
M=0

(LOOP1)
    // If RAM[KBD] = 0, j LOOP1
    @KBD
    D=M
    @LOOP1
    D;JEQ
    // Interrupt KBD Pressed
    // set i = start
    @start
    D=M
    @i
    M=D
    (LOOP2)
        // if i == stop j LOOP1
        @i
        D=M
        @stop
        D=D-M
        @LOOP1
        D;JEQ
        // RAM[i] = -1
        @i
        A=M
        M=-1
        // i++
        @i
        M=M+1
        @LOOP2
        D;JMP