.cpu cortex-a53
.fpu neon-fp-armv8

.data
	output: .asciz "The answer is %d\n"

.text
.align 2
.global main
.type main, %function

main:
	push {fp, lr}
	add fp, sp, #4

	sub sp, sp, #4
	mov r0, sp

	bl get_inp

	ldr r5, [sp]
	mov r6, #1
	mov r7, #1
loop:
	cmp r5, #1
	ble exit
	add r7, r6, r7
	sub r6, r7, r6
	sub r5, r5, #1
	b loop
exit:
	mov r1, r6
	ldr r0, =output
	bl printf

	sub sp, fp, #4
    	pop {fp, pc}
	