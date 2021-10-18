//function file
.global strlen
.data
// declare any global variables here
.text
strlen:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {r1} // push link register onto stack --
// make sure you pop it out before you return
mov r1, #0 //r1=0, r1=i
ldrb r2,[r0] //r2 = mem(r0), use ldrb cause a char is one bit
b while //branch to while
while: //inside while branch
cmp r2,#0 //compare r2 and 0
beq done //if r2=0, branch to done. 0 means end of string
bne cont //if r2!=0 branch to cont
cont: //inside cont branch:
add r1, r1, #1 //r1=r1+1, increment r1. r1 is a counter that represents string length
ldrb r2, [r0,r1] //r2=mem(r0+r1)
b while //branch back to while
done: //inside done branch
mov r0,r1 //r0=r1, return the value of r1
pop {r1} // pop link register from stack
mov sp,r12 // restore the stack pointer --
// Please note stack pointer should be equal to the
// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
