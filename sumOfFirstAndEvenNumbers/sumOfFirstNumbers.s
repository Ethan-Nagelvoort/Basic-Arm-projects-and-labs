/*
* Assembly.S
*/
.global sumofFirstNNumbers
.data
// declare any global variables here
.text
sumofFirstNNumbers:
// Do not modify and wory abou the next three lines. Include them in every function. This will be
clear as we learn more
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {r1} // push link register onto stack -- make sure you pop it out before you return
// SUMOFFIRSTNNUMBERS
//r3=N,r1=sum, r2=i
mov r1, #0 //set sum = 0
mov r2, #0 // set i = 0
ADD r3, r0, #1 // r3 = N+1
for:
cmp r2, r3 //r2-r3
beq return //if (i==N)
//exit loop
ADD r1, r1, r2 //sum = sum + i
ADD r2, r2, #1 //i = i+1
b for
return:
mov r0, r1//set N=sum, r0 is return register



// Do not modify and worry about the follwoing two lines. Include them in every function. This will
be clear as we learn more
pop {r1} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to
the

// value it had when you entered the function .

bx lr // return from the function by copying link register into program counter

