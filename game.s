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
	.file	"game.c"
	.text
	.align	2
	.global	initGame
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #16384
	ldr	r4, .L4
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r5, #464
	mov	r2, #0
	mov	r4, #2
	mov	r0, #32
	mov	lr, #352
	ldr	ip, .L4+24
	ldr	r1, [ip]
	ldr	r3, .L4+28
	add	r1, r1, #104
	str	r1, [r3, #4]
	ldr	r1, .L4+32
	str	r5, [r3]
	str	r4, [r3, #44]
	str	lr, [r1]
	str	r2, [ip]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #40]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100728832
	.word	FinalGameSpritesTiles
	.word	83886592
	.word	FinalGameSpritesPal
	.word	hideSprites
	.word	hOff
	.word	player
	.word	vOff
	.size	initGame, .-initGame
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L24
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, lr}
	ldr	r3, .L24+4
	ldr	lr, .L24+8
	tst	r2, #32
	ldr	ip, [lr]
	ldm	r3, {r1, r2}
	bne	.L7
	cmp	r2, #0
	ble	.L7
	ldr	r6, [r3, #44]
	sub	r4, r2, r6
	ldr	r5, .L24+12
	add	r0, r4, r1, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L7
	ldr	r0, [r3, #20]
	add	r0, r1, r0
	sub	r0, r0, #1
	add	r0, r4, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L7
	cmp	ip, #0
	str	r4, [r3, #4]
	ble	.L10
	ldr	r2, [r3, #12]
	cmp	r2, #119
	bgt	.L10
	mov	r2, r4
	sub	ip, ip, r6
	str	ip, [lr]
.L7:
	ldr	r0, .L24
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L8
	cmp	r2, #239
	bgt	.L8
	ldr	r0, [r3, #16]
	ldr	r5, [r3, #44]
	add	r0, r2, r0
	sub	r0, r0, #1
	add	r0, r0, r5
	ldr	r6, .L24+12
	add	r4, r0, r1, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r6, r4]
	cmp	r4, #0
	beq	.L8
	ldr	r4, [r3, #20]
	add	r4, r1, r4
	sub	r4, r4, #1
	add	r0, r0, r4, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L8
	add	r2, r2, r5
	cmp	ip, #15
	str	r2, [r3, #4]
	bgt	.L8
	ldr	r0, [r3, #12]
	cmp	r0, #120
	addgt	ip, ip, r5
	strgt	ip, [lr]
.L8:
	ldr	r0, .L24+16
	ldr	r0, [r0]
	sub	r2, r2, ip
	sub	r1, r1, r0
	str	r2, [r3, #12]
	str	r1, [r3, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	mov	r2, r4
	b	.L7
.L25:
	.align	2
.L24:
	.word	67109120
	.word	player
	.word	hOff
	.word	collisionMapBitmap
	.word	vOff
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	updatePlayer
	.size	updateGame, .-updateGame
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L29
	ldr	r3, [r1, #12]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #28]
	push	{r4, lr}
	ldrb	r0, [r1, #8]	@ zero_extendqisi2
	ldr	r4, .L29+4
	lsl	r2, r2, #2
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	ldr	r1, .L29+8
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L29+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L29+16
	ldrh	r1, [r2]
	ldr	r2, .L29+20
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	player
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r0, .L32
	ldr	r3, [r0, #12]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #28]
	ldr	r2, .L32+4
	ldrb	r0, [r0, #8]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L33:
	.align	2
.L32:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	player,48,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
