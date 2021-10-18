.global toPostFix
.data
// declare any global variables here
.text
toPostFix:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {r2} // push link register onto stack -- make sure you pop it out before you return
while: //Inside while branch:
cmp r0, #0x00
beq finish //brach to finish if r0 is at end of char array
cmp r0, #0x28
beq leftP //branch to ( if r0 equals ascii value of (
cmp r0, #0x29
beq rightP // branch to ) if r0 equals ascii vlaue of )
cmp r0, #0x2A
beq operators //branch to operators if r0 equal ascii value of *
cmp r0, #0x2B
beq operators //branch to operators if r0 equal ascii value of +
cmp r0, #0x2D
beq operators //branch to operators if r0 equal ascii value of -
cmp r0, #0x2F
beq operators //branch to operator if r0 equal ascii value of /
bne NoOperator //branch to NoOperator if r0 is not equal to any of the operators
NoOperator: //Inside NoOperator branch:
str r0,[r1] //store whats in r0 into r1
add r0,r0,#1 //Increment r0
add r1,r1,#1 //Increment r1
b while //branch back to while
leftP: //iniside leftP branch:
push{r0} //push r0 onto the stack
add r0,r0,#1 //increment r0
b while //branch back to while
rightP: //inside rightP branch:
pop{r2} //pop stack into r2
cmp r2,#0x28
beq while //if r2 is equal to ascii value of ( then branch to while
str r0,[r1] //store whats in r0 into r1
add r0,r0,#1 //increment r0
add r1,r1,#1 //increment r1
b rightP //branch back to rightP
operators: //inside operators branch:
pop{r2} //pop stack onto r2
cmp r2,r0
blt order //branch to order if r2&lt;r0
bgt while //branch to while if r2&gt;r0
order: //inside order branch:
cmp r2, #0x2A
beq c1 //branch to c1 if r2 = * value
cmp r2, #0x2F
bne c2 //branch to c2 if r2 != / value
c1: //inside c1 branch:
cmp r2, #0x2B
beq goBack //branch to goBack if r2 = + vlaue
cmp r2, #0x2D
bne finish //branch to finish if r2 != -
c2: //Inside c2 branch:
pop{r2} //pop from stack into r2
mov r1,r2 //move contents of r2 into r1
add r1,r1, #1 //increment r1
b operators //branch back to operators
finish: //Inside finish branch
pop {r2} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
