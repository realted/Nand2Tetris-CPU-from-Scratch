// Computes multiplication 
// i = 1, sum = 0

@i 
M = 0
@sum
M = 0

(LOOP)
	// if i == n go to end 
	@i 
	D = M
	@R1
	D = D - M
	@END
	D; JEQ
	
	// sum = sum = RAM[0]
	@R0
	D = M
	@sum
	M = D + M
	
	// i = i + 1
	@i
	M = M + 1
	@LOOP
	0; JMP
	

// RAM[2] = sum
(END)
	@sum
	D = M
	@R2
	M = D
	@END
	0; JMP

