//Arm version of code:
.global lfsr32
.data
// declare any global variables here
.text
lfsr32:
mov r12,r13 //save stack pointer into register r12
sub sp,#32 //reserve 32 bytes of space for local variables
push {r4} //push link register onto stack -- make sure you pop it out before you return
cmp r0,#0
bne if //branch to if branch if r0!=0
mov r1,r0 //r1=r0
add r1,r1,#1 //increment r1
mov r0,r1 //r0=r1
b end //branch to end
if: //inside if branch:
mov r1,r0 //r1=r0
mov r2,r1 //r2=r1
mov r3,#0 //r3=0
mov r4,#0 //r4=0
b do //branch to do
do: //inside do branch:
lsr r5, r2, #0 //r5 = r2>> 0
lsr r6, r2, #2 //r6 = r2 >> 2
mov r3, r6 //r3 = r6
eor r3, r5, r3 //r3 = r5 ^ r6
lsr r5, r2, #6 //r5 = r2 >> 6
lsr r6, r2, #7 //r6 = r2 >> 7

ETHAN NAGELVOORT, 821234668 HOMEWORK 9
eor r3, r3, r5 //r3 = r3 ^ r5
eor r3, r3, r6 //r3 = r3 ^ r6
lsr r5, r2, #1 //r5 = r2 >> 1
lsl r3, r2, #31 //r3 = r2 << 31
orr r3, r3, r5 //r3 = r3 | r5
add r4, r4, #1 //increment r4
b while //branch to while
while: //inside while branch:
cmp r1, r2
bne do //branch to do if r1 != r2
mov r0, r4 //r0=r4
b end //branch to end
end: //inside end branch
pop {r4} //pop link register from stack
mov sp,r12 //restore the stack pointer -- Please note stack pointer should be equal to
the

//value it had when you entered the function .

mov pc,lr //return from the function by copying link register into program counter
