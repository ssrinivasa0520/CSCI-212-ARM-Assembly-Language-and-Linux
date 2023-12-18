	.arch armv6
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"test.c"	@ identifies source file
	.text			@ text section
	.align	2		@ alignment for 4 but instructions
	.global	test		@ declare test as global
	.arch armv6
	.syntax unified
	.arm
	.fpu vfp
	.type	test, %function	@ declares test as a function
test:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!	@ save caller frame pointer
	add	fp, sp, #0	@ establish our frame pointer
	sub	sp, sp, #12	@ decrement stc pointer by 12
	str	r0, [fp, #-8]	
	ldr	r2, [fp, #-8]
	ldr	r3, .L3		@ load raw data into register
	smull	r1, r3, r3, r2	@ signed long multiplication
	asr	r1, r3, #2	@ arithmetic shift right
	asr	r3, r2, #31	@ arithmetic shift right
	sub	r1, r1, r3
	mov	r3, r1
	lsl	r3, r3, #2	@ logical shift left
	add	r3, r3, r1
	lsl	r3, r3, #1
	sub	r1, r2, r3
	mov	r3, r1
	mov	r0, r3		@ storing return value
	add	sp, fp, #0	@ restore stack pointer
	@ sp needed
	ldr	fp, [sp], #4	@ restore caller's frame pointer
	bx	lr		@ back to caller
.L4:				@ compiler generated labels
	.align	2
.L3:
	.word	1717986919	@ passed parameter
	.size	test, .-test
	.section	.rodata	@raw data section
	.align	2
.LC0:
	.ascii	"The digit in the ones place of %d is %d\012\000" 	@string passed to printf
	.text
	.align	2
	.global	main	@declare main as global
	.syntax unified
	.arm
	.fpu vfp
	.type	main, %function @declare main as a function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L7		@ load integer 294
	str	r3, [fp, #-8]
	ldr	r0, [fp, #-8]
	bl	test		@ call test
	mov	r3, r0		@ store returned value in register
	mov	r2, r3
	ldr	r1, [fp, #-8]
	ldr	r0, .L7+4
	bl	printf		@ call printf
	mov	r3, #0		
	mov	r0, r3		@ return 0
	sub	sp, fp, #4	@restore stack pointer
	@ sp needed
	pop	{fp, pc}
.L8:
	.align	2
.L7:
	.word	294
	.word	.LC0
	.size	main, .-main
	.ident	"GCC: (Raspbian 8.3.0-6+rpi1) 8.3.0"
	.section	.note.GNU-stack,"",%progbits
