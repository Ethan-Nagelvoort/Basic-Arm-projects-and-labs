/*
* AssemblyFunctions.S
*
*/
.global computeMagicNumber
.text
computeMagicNumber:
mov r12, r13 // saves stack pointer in register r12
sub sp, #32 // reserve 32 bytes for local variables
push {r2} // push link register onto stack
mov r1, #0 // r1 = 0, this is counter variable
// r0 holds parameter string
while: // inside while branch
ldrb r2, [r0,r1] //load register r2 with whatever is in mem location of r0+r1
cmp r2,#0
beq zero // branch to zero if r1 = 0
bne notZero // branch to notZero if r1 != 0
notZero: //inside notZero branch
add r1, r1, #1 //r1 = r1 + 1
b while //loop back to while branch
zero: //inside zero branch
mov r2, #0 //r2 = 0

ETHAN NAGELVOORT, 821234668 HOMEWORK 7
mov r3, #0 //r3 = 0
b For //branch to For branch
For: //inside For branch
cmp r3, r1
bge end //branch to end if r3&gt;=r1
blt inside //branch to inside if r3&lt;r1
inside: //inside inside branch
ldrb r4, [r0,r3] //load register r4 with whatever is in mem location r0+r3
add r3, r3, #1 //r3 = r3 + 1
mul r4, r4, r3 //r4 = r4 * r3
add r2, r2, r4 //r2 = r2 + r4
b For //loop back to For branch
end: //inside end branch
mov r3, #100 //r3 = 100
mov r4, #10 //r4 = 10
mul r3, r3, r4 //r3= r3*r4
add r3, r3, #1 //r3= r3+1
udiv r1, r2, r3 //r1 = r2/r3
mul r1, r1, r3 //r1 = r1*r3
sub r2, r2, r1 //r2=r2-r1
mov r0, r2 //return r2
pop {r2} //pop link register from stack
mov sp, r12 //restore the stack pointer
bx lr
