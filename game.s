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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r0, #3
	ldr	r4, .L6
	mov	r3, #16384
	ldr	r2, .L6+4
	ldr	r1, .L6+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L6+12
	ldr	r1, .L6+16
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L6+20
	mov	lr, pc
	bx	r3
	mov	r5, #1
	mov	ip, #8
	mov	r9, #2
	mov	r6, #0
	mov	r10, #32
	mov	fp, #464
	mov	r1, r9
	mov	r0, ip
	mov	r4, r5
	mov	r2, #200
	mov	lr, #488
	ldr	r8, .L6+24
	ldr	r7, [r8]
	ldr	r3, .L6+28
	add	r7, r7, #104
	str	r7, [r3, #4]
	str	fp, [r3]
	str	r10, [r3, #16]
	str	r10, [r3, #20]
	str	r6, [r3, #24]
	str	r6, [r3, #28]
	str	r6, [r3, #40]
	str	r9, [r3, #44]
	ldr	r3, .L6+32
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r5, [r3, #24]
	str	r5, [r3, #28]
	ldr	r3, .L6+36
.L2:
	str	r2, [r3, #4]
	add	r2, r2, #10
	cmp	r2, #240
	str	r1, [r3, #28]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	lr, [r3]
	str	r4, [r3, #24]
	add	r1, r1, #1
	add	r3, r3, #32
	bne	.L2
	mov	r2, #352
	mov	r1, #0
	ldr	r3, .L6+40
	str	r1, [r8]
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	DMANow
	.word	100728832
	.word	FinalGameSpritesTiles
	.word	83886592
	.word	FinalGameSpritesPal
	.word	hideSprites
	.word	hOff
	.word	player
	.word	gem
	.word	gems
	.word	vOff
	.size	initGame, .-initGame
	.align	2
	.global	initGems
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGems, %function
initGems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r2, #8
	str	lr, [sp, #-4]!
	mov	lr, #488
	add	r3, r1, r1, lsl #2
	lsl	r3, r3, ip
	add	r1, r1, #2
	add	r3, r3, #200
	str	lr, [r0]
	str	r1, [r0, #28]
	str	r3, [r0, #4]
	str	ip, [r0, #24]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	ldr	lr, [sp], #4
	bx	lr
	.size	initGems, .-initGems
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
	ldr	r3, .L28
	ldrh	r2, [r3, #48]
	push	{r4, r5, r6, lr}
	ldr	r3, .L28+4
	ldr	lr, .L28+8
	tst	r2, #32
	ldr	ip, [lr]
	ldm	r3, {r1, r2}
	bne	.L11
	cmp	r2, #0
	ble	.L11
	ldr	r6, [r3, #44]
	sub	r4, r2, r6
	ldr	r5, .L28+12
	add	r0, r4, r1, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L11
	ldr	r0, [r3, #20]
	add	r0, r1, r0
	sub	r0, r0, #1
	add	r0, r4, r0, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r5, r0]
	cmp	r0, #0
	beq	.L11
	cmp	ip, #0
	str	r4, [r3, #4]
	ble	.L14
	ldr	r2, [r3, #12]
	cmp	r2, #119
	bgt	.L14
	mov	r2, r4
	sub	ip, ip, r6
	str	ip, [lr]
.L11:
	ldr	r0, .L28
	ldrh	r0, [r0, #48]
	tst	r0, #16
	bne	.L12
	cmp	r2, #239
	bgt	.L12
	ldr	r0, [r3, #16]
	ldr	r5, [r3, #44]
	add	r0, r2, r0
	sub	r0, r0, #1
	add	r0, r0, r5
	ldr	r6, .L28+12
	add	r4, r0, r1, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r6, r4]
	cmp	r4, #0
	beq	.L12
	ldr	r4, [r3, #20]
	add	r4, r1, r4
	sub	r4, r4, #1
	add	r0, r0, r4, lsl #8
	lsl	r0, r0, #1
	ldrh	r0, [r6, r0]
	cmp	r0, #0
	beq	.L12
	add	r2, r2, r5
	cmp	ip, #15
	str	r2, [r3, #4]
	bgt	.L12
	ldr	r0, [r3, #12]
	cmp	r0, #120
	addgt	ip, ip, r5
	strgt	ip, [lr]
.L12:
	ldr	r0, .L28+16
	ldr	r0, [r0]
	sub	r2, r2, ip
	sub	r1, r1, r0
	str	r2, [r3, #12]
	str	r1, [r3, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	mov	r2, r4
	b	.L11
.L29:
	.align	2
.L28:
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
	push	{r4, r5, r6, r7, r8, lr}
	mov	r7, #8
	bl	updatePlayer
	ldr	r1, .L34
	ldr	r2, .L34+4
	ldr	r3, .L34+8
	ldr	r6, [r1]
	ldr	r5, [r2]
	ldr	ip, .L34+12
	ldr	r4, .L34+16
	add	lr, r3, #128
.L31:
	ldm	r3, {r1, r2}
	ldr	r0, [r3, #28]
	sub	r2, r2, r6
	sub	r1, r1, r5
	str	r2, [r3, #12]
	str	r1, [r3, #8]
	add	r3, r3, #32
	lsl	r8, r0, #3
	and	r2, r2, r4
	add	r0, ip, r0, lsl #3
	and	r1, r1, #255
	cmp	r3, lr
	strh	r1, [ip, r8]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r7, [r0, #4]	@ movhi
	bne	.L31
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	hOff
	.word	vOff
	.word	gems
	.word	shadowOAM
	.word	511
	.size	updateGame, .-updateGame
	.align	2
	.global	updateGems
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGems, %function
updateGems:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #8
	ldr	r3, .L38
	ldr	ip, .L38+4
	ldr	r2, [r3]
	ldr	r1, [r0, #4]
	ldr	ip, [ip]
	ldr	r3, [r0]
	sub	r1, r1, r2
	ldr	lr, .L38+8
	ldr	r2, [r0, #28]
	sub	r3, r3, ip
	lsl	ip, r1, #23
	str	r1, [r0, #12]
	str	r3, [r0, #8]
	lsl	r1, r2, #3
	lsr	ip, ip, #23
	add	r2, lr, r2, lsl #3
	and	r3, r3, #255
	strh	r3, [lr, r1]	@ movhi
	strh	r4, [r2, #4]	@ movhi
	strh	ip, [r2, #2]	@ movhi
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	updateGems, .-updateGems
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
	ldr	ip, .L42
	push	{r4, r5, r6, lr}
	ldr	r3, [ip, #12]
	ldr	lr, .L42+4
	and	r3, r3, lr
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r5, #8
	ldr	r4, .L42+8
	ldr	r0, .L42+12
	ldr	r1, [ip, #28]
	ldr	r2, [r0, #4]
	ldrb	ip, [ip, #8]	@ zero_extendqisi2
	strh	r3, [r4, #2]	@ movhi
	ldr	r3, [r0, #28]
	lsl	r1, r1, #2
	ldrb	r0, [r0]	@ zero_extendqisi2
	and	r2, r2, lr
	strh	r1, [r4, #4]	@ movhi
	lsl	r1, r3, #3
	add	r3, r4, r3, lsl #3
	strh	ip, [r4]	@ movhi
	strh	r0, [r4, r1]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r5, [r3, #4]	@ movhi
	ldr	r1, .L42+16
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L42+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L42+24
	ldrh	r1, [r2]
	ldr	r2, .L42+28
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L43:
	.align	2
.L42:
	.word	player
	.word	511
	.word	shadowOAM
	.word	gem
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
	ldr	r0, .L45
	ldr	r3, [r0, #12]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #28]
	ldr	r2, .L45+4
	ldrb	r0, [r0, #8]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L46:
	.align	2
.L45:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGem
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGem, %function
drawGem:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #8
	ldr	r1, .L49
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L49+4
	str	lr, [sp, #-4]!
	lsl	r2, r2, #23
	ldrb	lr, [r1]	@ zero_extendqisi2
	lsr	r2, r2, #23
	lsl	r1, r3, #3
	add	r3, r0, r3, lsl #3
	strh	lr, [r0, r1]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	ip, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L50:
	.align	2
.L49:
	.word	gem
	.word	shadowOAM
	.size	drawGem, .-drawGem
	.comm	gem,32,4
	.comm	gems,128,4
	.comm	player,48,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
