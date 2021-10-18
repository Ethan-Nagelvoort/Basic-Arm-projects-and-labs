//function file
.global doubleswap
.data
// declare any global variables here
.text
doubleswap:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
//push {r2} // push link register onto stack -- make sure you pop it out before you
return
// r0 = x, r1 = y
ldr r2,[r0] // load the bottom portion of x into r2
ldr r3,[r0,#4] // load the top portion of x into r3
ldr r4,[r1] // load the bottom portion of y into r4
ldr r5,[r1,#4] // load the top portion of y into r5
str r2,[r1] // store r2 into the bottom portion of y
str r3,[r1,#4] // store r3 into the top portion of y
str r4,[r0] // store r4 into the bottom portion of x
str r5,[r0,#4] // store r5 into the top portion of x
// pop {r2} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to
the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
