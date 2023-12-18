.cpu cortex-a53
.fpu neon-fp-armv8

.data
	output: .asciz "The GCD is %d\n"

.text
.align 2
.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4
	
	sub sp, sp, #4
	mov r0, sp
	sub sp, sp, #4
	mov r1, sp

	bl get_inp

	ldr r6,	[sp] 
	ldr r5, [sp, #4]

	cmp r5, r6
	bgt resume
	add r5, r5, r6
	sub r6, r5, r6
	sub r5, r5, r6
resume:
	udiv r7, r5, r6
	mul r7, r7, r6
	sub r7, r5, r7
	cmp r7, #0
	beq break
	mov r5, r6
	mov r6, r7
	b resume
break:
	mov r1, r6
	ldr r0, =output
	bl printf
	
	sub  sp, fp, #4
	pop {fp, pc}
