/*
* AFunctions.s
*
* Please rename this file as Homework6_yourReadID.s and submit only this file
*/
.global isNumber
.data
// declare any global variables here
.text
isNumber:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {lr} // push link register onto stack -- make sure you pop it out before you return
ldrb r1,[r0] //load character bit into r1
cmp r1,#0x30 //Use ascii table to see if character is greater than 0x30, use cmp
BGE if1 //if is goto branch if1
b exit //if not branch to exit
if1: //inside branch if1
cmp r1,#0x39 //use ascii table to see if character is less than 0x39, use cmp
BLE if2 //if is goto branch if2
b exit //if not branch to exit
if2: //inside branch if2
mov r0, #1 //character is a digit, so have r0 contain #1
b exit2 //branch to exit2
exit: //inside branch exit
mov r0, #0 //character is not a digit, so have r0 contain #0
b exit2 //branch to exit2
exit2: //inside branch exit2
pop {r1} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
.global compare
.data
// declare any global variables here
.text
compare:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {lr} // push link register onto stack -- make sure you pop it out before you return


//r0 = a, r1=b
mov r2, r0 //put a in r2
cmp r2, r1 //cmp a, b
BGT end //branch to end if a>;b
BLT end2 //branch to end2 if a<;b
BEQ end3 //branch to end3 if a=b
end: //inside branch end
mov r0,#1 //return 1
b end4 //branch to end4
end2: //inside branch end2
mov r3,#0 //r3 = 0
add r3,r3,#-1 //r3 = r3 + (-1)
mov r0, r3 //return -1
b end4 //branch to end4
end3: //inside branch end3
mov r0,#0 //return 0
b end4 //branch to end4
end4: //inside end4
pop {r1} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
.global countOnes
.data
// declare any global variables here
countOnes:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {lr} // push link register onto stack -- make sure you pop it out before you return
// r0 = int number
mov r1, r0 // r1 = r0/int number
mov r2, #0 // r2 = 0, r2 is counter variable
while: //inside while branch
cmp r1, #0 //check if (r1 = 0)
beq done //branch to done if r1==0
bne loop //branch to loop if r1!=0
loop: //inside loop branch


mov r3, #1 //r3 = 1
and r3, r1, r3 //r3 = r0 &amp; r3 or number = number &amp; 1
add r2, r2, r3 //r2 = r2 + r3, adds 1 if r3 is 1 and 0 if r3 is 0
lsr r1, r1, #1 // r1 = r1 >> 1, done in order to loop through bits of integer
b while // branches back to while branch
done: //inside done branch
mov r0, r2 // return r2, the counter varialbe
pop {r2} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to
the

// value it had when you entered the function .

mov pc,lr // return from the function by copying link register into program counter
.global returnHammingDistance
.data
// declare any global variables here
returnHammingDistance:
mov r12,r13 // save stack pointer into register r12
sub sp,#32 // reserve 32 bytes of space for local variables
push {lr} // push link register onto stack -- make sure you pop it out before you return
// r0 = firstparameter, r1 = secondparameter
mov r2, r0 // r2 = r0, firstparameter
eor r1, r2, r1 // r1 = r2 ^ r1, helps determine which bits are different between the two
mov r3, #0 // r3 = 0, this will hold the result
while2: //inside while2 branch
cmp r1, #0 //check if(r1 = 0)
beq finish //branch to finish if r1 = 0
bne loop2 //branch to loop2 if r1 != 0
loop2: //inside loop2 branch
mov r4, #1 //r4 = 1
and r4, r1, r4 //r4 = r1 &amp; r4/1
add r3, r3, r4 //r3 = r3 + r4
lsr r1, r1, #1 //r1= r1 &gt;&gt; 1
b while2 //loop back to while2 branch
finish: //inside finish branch
mov r0, r3 //r0 = r3, return result
pop {r4} // pop link register from stack
mov sp,r12 // restore the stack pointer -- Please note stack pointer should be equal to
the

// value it had when you entered the function .


mov pc,lr // return from the function by copying link register into program counter
