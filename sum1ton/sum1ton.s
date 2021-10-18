//function file
.global sum1ton
.data
// declare any global variables here
.text
sum1ton:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {r2} // push link register onto stack -- make sure you pop it out before you return
mov r1,r0 //r1 = r0, r1 is now n
mov r2,#0 //r2 = 0, r2 is x
mov r3,#0 //r3=0, r3 is i
add r1, r1, #1 //r1 = r1+1
b for //branch to for
for: //inside for branch
cmp r1,r3 //compare r1 and r3
beq end //if r1=r3 then branch to end
add r2, r2, r3 //r2 = r2 + r3
add r3, r3, #1 //r3 = r3 + 1, increment r3
b for //branch back to for
end: //inside end branch
mov r0, r2 // r0 = r2
pop {r2} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to
the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
