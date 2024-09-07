CHIP FullAdder {
    IN a, b, c;  // 1-bit inputs
    OUT sum,     // Right bit of a + b + c
        carry;   // Left bit of a + b + c

    PARTS:
    Xor(a = a, b = b, out = d1);
    Xor(a = d1, b = c, out = sum);
    And(a= a, b= b, out= d2);
    And(a= a, b= c, out= d3);
    And(a= b, b= c, out= d4);
    Or(a= d2, b= d3, out= d5);
    Or(a= d4, b= d5, out= carry);
}