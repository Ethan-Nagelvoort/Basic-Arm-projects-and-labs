//function file
.global sum_squares
.data
// declare any global variables here
.text
sum_squares:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
// push {r2} // push link register onto stack -- make sure you pop it out before you return
mov r6, #0 //r6=0, r6 will equal previous value in loop to help detect overflow
mov r4, #0 //r4=0, r4=i
mov r2, #0 //r2=0, r2 = sum
ldr r3, [r0] //load r0 into r3
while: //inside while branch
cmp r4,r1 //compare r4,r1
beq done //if r4 = r1, then branch to done
umull r3,r5,r3,r3 //unsigned multiplication: r3=r3*r3
add r2,r2,r3 //r2=r2+r3
cmp r6, r2 //compare r6 and r2
bgt over //if r6>r2, then branch to over
add r4, r4, #1 //r4= r4+1, increment r4
lsl r7, r4, #2 //r7=r4<<2, r7=r4+4

ldr r3, [r0, r7] //load mem(r0+r7) into r3
mov r6,r2 //r6=r2
b while //branch back to while
over: //inside over branch
mov r0, #0 //r0=0
sub r0, r0, #1 //r0=r0-1
b end //branch to end
done: //inside done branch
mov r0, r2 //r0=r2
b end //branch to end
end: //inside end branch
//pop {r2} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal
to the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
