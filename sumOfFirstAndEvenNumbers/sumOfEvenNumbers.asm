.global sumofEvenNumbers
.data
// declare any global variables here
.text
sumofEvenNumbers:
// Do not modify and wory abou the next three lines. Include them in every function. This will be
clear as we learn more
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {r3} // push link register onto stack -- make sure you pop it out before you return
//r2 = result, r0 = n1, r1 = n2
mov r2, #0 // r2 = 0
mov r3, r0 // r3 = r0
while:
cmp r3,r1 //if r3 >= r1 then n1>=n2. If this is true, loop ends
bge done
mov r4, r3 // r4 = r3
lsr r4, r4, #1 // r3 = r3 >> 1
lsl r4, r4, #1 // r3 = r3<<1
cmp r3, r4
beq b1
bne b2
b1:
add r2, r2, r3 // r2=r2+1
add r3, r3, #1
b while
b2:
add r3, r3, #1 // r3=r3+1
b while


done: //while loop does not check if last number is even or not, so following code does
lsr r3, r3, #1 //r3 = r3 >> 1
lsl r3, r3, #1 //r3 = r3 << 1
cmp r3, r1
BNE done2
add r2, r2, r3 //r2 = r2 + r3
done2:
mov r0, r2
// Do not modify and worry about the follwoing two lines. Include them in every function. This will be clear as we learn more
pop {r3} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to the
// value it had when you entered the function .

bx lr // return from the function by copying link register into program counter
