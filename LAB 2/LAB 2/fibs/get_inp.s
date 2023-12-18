.cpu cortex-a53
.fpu neon-fp-armv8

.data

outp2: .asciz "Enter a number: "
inp: .asciz  "%d"

.text
.align 2
.global get_inp
.type get_inp, %function

get_inp:
    push {fp, lr}
    add fp, sp, #4

    mov r4, r0

    ldr r0, =outp2
    bl printf

    ldr r0, =inp
    mov r1, r4

    bl scanf

    sub sp, fp, #4
    pop {fp, pc}

