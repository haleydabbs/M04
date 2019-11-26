	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"sound.c"
	.text
	.align	2
	.global	interruptHandler
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #0
	ldr	r3, .L19
	ldrh	r2, [r3, #2]
	tst	r2, #1
	strh	r4, [r3, #8]	@ movhi
	beq	.L2
	ldr	r5, .L19+4
	ldr	r3, [r5, #12]
	cmp	r3, r4
	beq	.L4
	ldr	r3, [r5, #28]
	ldr	r2, [r5, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r5, #28]
	ble	.L4
	ldr	r3, [r5, #16]
	ldr	r2, .L19+8
	cmp	r3, r4
	ldr	r2, [r2]
	bne	.L16
	ldr	r1, .L19+12
	ldr	r0, [r2, #20]
	str	r3, [r5, #12]
	str	r3, [r2, #20]
	strh	r3, [r1, #2]	@ movhi
.L4:
	ldr	r4, .L19+16
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L17
.L8:
	mov	r2, #1
	ldr	r3, .L19
	strh	r2, [r3, #2]	@ movhi
.L2:
	mov	r2, #1
	ldr	r3, .L19
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L17:
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	add	r3, r3, #1
	cmp	r3, r2
	str	r3, [r4, #28]
	ble	.L8
	ldr	r3, [r4, #16]
	ldr	r2, .L19+8
	cmp	r3, #0
	ldr	r2, [r2]
	bne	.L18
	ldr	r1, .L19+12
	ldr	r0, [r2, #32]
	str	r3, [r4, #12]
	str	r3, [r2, #32]
	strh	r3, [r1, #6]	@ movhi
	b	.L8
.L16:
	str	r4, [r2, #20]
	mov	r3, #910163968
	mov	r0, #1
	ldr	r2, .L19+20
	ldr	r1, [r5]
	ldr	r6, .L19+24
	mov	lr, pc
	bx	r6
	str	r4, [r5, #28]
	b	.L4
.L18:
	mov	r5, #0
	mov	r3, #910163968
	str	r5, [r2, #32]
	mov	r0, #2
	ldr	r2, .L19+20
	ldr	r1, [r4]
	ldr	r6, .L19+24
	mov	lr, pc
	bx	r6
	str	r5, [r4, #28]
	b	.L8
.L20:
	.align	2
.L19:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.word	67109024
	.word	DMANow
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	setupSounds
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L22
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L23:
	.align	2
.L22:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.global	__aeabi_idiv
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.align	2
	.global	playSoundA
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r8, #0
	mov	r5, r2
	mov	r9, r3
	ldr	r3, .L26+8
	ldr	r3, [r3]
	ldr	r10, .L26+12
	mov	r6, r1
	mov	r7, r0
	mov	r1, r0
	str	r8, [r3, #20]
	ldr	r2, .L26+16
	mov	r3, #910163968
	mov	r0, #1
	ldr	r4, .L26+20
	mov	lr, pc
	bx	r4
	mov	r1, r5
	strh	r8, [r10, #2]	@ movhi
	ldr	r3, .L26+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	ip, r0, #0
	ldr	r4, .L26+28
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	strh	ip, [r10]	@ movhi
	mov	r0, r6
	strh	r2, [r10, #2]	@ movhi
	ldr	r10, .L26+32
	str	r7, [r4]
	str	r6, [r4, #4]
	str	r5, [r4, #8]
	str	r3, [r4, #12]
	str	r9, [r4, #16]
	mov	lr, pc
	bx	r10
	ldr	r6, .L26+36
	adr	r3, .L26
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r6
	mov	r6, r0
	mov	r0, r5
	mov	r7, r1
	mov	lr, pc
	bx	r10
	ldr	r5, .L26+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r6
	mov	r1, r7
	mov	lr, pc
	bx	r5
	ldr	r3, .L26+44
	mov	lr, pc
	bx	r3
	str	r8, [r4, #28]
	str	r0, [r4, #20]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L27:
	.align	3
.L26:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.syntax unified
	.arm
	.fpu softvfp
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r7, #0
	mov	r4, r2
	mov	r8, r3
	ldr	r3, .L30+8
	ldr	r3, [r3]
	ldr	r9, .L30+12
	mov	r5, r1
	mov	r6, r0
	mov	r1, r0
	str	r7, [r3, #32]
	ldr	r2, .L30+16
	mov	r3, #910163968
	mov	r0, #2
	ldr	r10, .L30+20
	mov	lr, pc
	bx	r10
	mov	r1, r4
	strh	r7, [r9, #6]	@ movhi
	ldr	r3, .L30+24
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r2, #128
	mov	r3, #1
	rsb	ip, r0, #0
	ldr	r10, .L30+28
	lsl	ip, ip, #16
	lsr	ip, ip, #16
	strh	ip, [r9, #4]	@ movhi
	mov	r0, r5
	strh	r2, [r9, #6]	@ movhi
	ldr	r9, .L30+32
	str	r6, [r10]
	str	r5, [r10, #4]
	str	r4, [r10, #8]
	str	r3, [r10, #12]
	str	r8, [r10, #16]
	mov	lr, pc
	bx	r9
	ldr	r5, .L30+36
	adr	r3, .L30
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r5
	mov	r2, r0
	mov	r0, r4
	mov	r5, r1
	mov	r4, r2
	mov	lr, pc
	bx	r9
	ldr	r6, .L30+40
	mov	r2, r0
	mov	r3, r1
	mov	r0, r4
	mov	r1, r5
	mov	lr, pc
	bx	r6
	ldr	r3, .L30+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L30+48
	str	r0, [r10, #20]
	str	r7, [r3, #28]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L31:
	.align	3
.L30:
	.word	1443109011
	.word	1078844686
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	soundA
	.size	playSoundB, .-playSoundB
	.align	2
	.global	setupInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldrh	r1, [r0, #4]
	ldr	r3, .L34
	orr	r1, r1, #8
	ldrh	r2, [r3]
	ldr	ip, .L34+4
	strh	r1, [r0, #4]	@ movhi
	ldr	r1, .L34+8
	orr	r2, r2, lr
	strh	lr, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	ldr	lr, [sp], #4
	str	r1, [ip, #4092]
	bx	lr
.L35:
	.align	2
.L34:
	.word	67109376
	.word	50360320
	.word	interruptHandler
	.size	setupInterrupts, .-setupInterrupts
	.align	2
	.global	pauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L37
	ldr	r0, .L37+4
	ldr	r1, .L37+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L38:
	.align	2
.L37:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L40
	ldr	ip, .L40+4
	ldr	r0, .L40+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L41:
	.align	2
.L40:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.syntax unified
	.arm
	.fpu softvfp
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	ldr	r2, .L44
	ldr	r0, .L44+4
	ldr	r2, [r2]
	str	lr, [sp, #-4]!
	ldr	r1, [r2, #20]
	ldr	ip, .L44+8
	str	r3, [r2, #20]
	ldr	r1, .L44+12
	strh	r3, [r0, #2]	@ movhi
	str	r3, [ip, #12]
	ldr	lr, [r2, #32]
	str	r3, [ip, #28]
	str	r3, [r2, #32]
	str	r3, [r1, #12]
	ldr	lr, [sp], #4
	strh	r3, [r0, #6]	@ movhi
	str	r3, [r1, #28]
	bx	lr
.L45:
	.align	2
.L44:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
