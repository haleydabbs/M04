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
	mov	r6, #1
	mov	ip, #8
	mov	r9, #2
	ldr	r8, .L6+24
	ldr	r7, [r8]
	ldr	r1, .L6+28
	add	r7, r7, #104
	mov	lr, #0
	str	r7, [r1, #4]
	mov	r10, #32
	mov	fp, #464
	mov	r7, #475136
	mov	r2, r9
	mov	r0, ip
	mov	r5, r6
	mov	r3, #200
	mov	r4, #488
	str	fp, [r1]
	str	r10, [r1, #20]
	str	r10, [r1, #24]
	str	lr, [r1, #28]
	str	r7, [r1, #8]
	str	lr, [r1, #32]
	str	lr, [r1, #48]
	str	lr, [r1, #44]
	str	r9, [r1, #52]
	ldr	r1, .L6+32
	str	ip, [r1, #16]
	str	ip, [r1, #20]
	str	ip, [r1]
	str	ip, [r1, #4]
	str	r6, [r1, #24]
	str	r6, [r1, #28]
	ldr	r1, .L6+36
.L2:
	str	r3, [r1, #4]
	add	r3, r3, #10
	cmp	r3, #240
	str	r2, [r1, #28]
	str	r0, [r1, #16]
	str	r0, [r1, #20]
	str	r4, [r1]
	str	r5, [r1, #24]
	add	r2, r2, #1
	add	r1, r1, #32
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
	ldr	r0, .L58
	push	{r4, r5, r6, r7, lr}
	ldr	lr, [r0, #8]
	ldr	r1, [r0, #44]
	cmp	lr, #0
	add	r2, lr, #1020
	add	r2, r2, #3
	add	r3, r1, #1020
	movge	r2, lr
	cmp	r1, #0
	add	r3, r3, #3
	movge	r3, r1
	ldr	ip, .L58+4
	ldrh	ip, [ip, #48]
	asr	r2, r2, #10
	asr	r3, r3, #10
	tst	ip, #32
	str	r2, [r0]
	str	r3, [r0, #48]
	ldr	r4, [r0, #4]
	bne	.L55
	cmp	r4, #0
	ble	.L55
	ldr	r6, [r0, #52]
	sub	ip, r4, r6
	ldr	r5, .L58+8
	add	r3, ip, r2, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	bne	.L52
.L55:
	ldr	r5, .L58+12
.L11:
	ldr	r3, .L58+4
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L12
	cmp	r4, #239
	ble	.L56
.L12:
	cmn	r1, #1024
	ble	.L13
	ldr	r6, [r0, #24]
	add	r6, r2, r6
	ldr	r3, .L58+8
	add	r7, r4, r6, lsl #8
	lsl	ip, r7, #1
	ldrh	ip, [r3, ip]
	cmp	ip, #0
	ldr	ip, [r0, #20]
	bne	.L57
.L14:
	add	ip, ip, r4
	add	r1, ip, r6, lsl #8
	sub	r1, r1, #256
	sub	r1, r1, #-2147483647
	rsb	ip, ip, ip, lsl #31
	add	lr, r4, #1
	mov	r6, #0
	add	r3, r3, r1, lsl #1
	lsl	ip, ip, #1
	lsl	lr, lr, #1
	b	.L16
.L17:
	mov	r6, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L16:
	add	r1, ip, r3
	ldrh	r1, [r1, lr]
	cmp	r1, #0
	beq	.L17
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L17
	ldr	r3, .L58+16
	ldrh	r3, [r3]
	cmp	r6, #0
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L19
	ldr	r3, .L58+20
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L19
	ldr	r3, .L58+24
	ldr	r2, [r0]
	str	r3, [r0, #44]
	add	r1, r1, r3
	b	.L20
.L57:
	add	r7, r7, ip
	add	r7, r3, r7, lsl #1
	ldrh	r7, [r7, #-2]
	cmp	r7, #0
	beq	.L14
.L13:
	add	r1, r1, #500
	str	r1, [r0, #44]
	add	r1, lr, r1
.L20:
	ldr	r3, .L58+28
	ldr	ip, [r5]
	ldr	r3, [r3]
	sub	r4, r4, ip
	sub	r2, r2, r3
	str	r4, [r0, #16]
	str	r1, [r0, #8]
	str	r2, [r0, #12]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L56:
	ldr	r3, [r0, #20]
	ldr	r6, [r0, #52]
	add	r3, r4, r3
	sub	r3, r3, #1
	add	r3, r3, r6
	ldr	r7, .L58+8
	add	ip, r3, r2, lsl #8
	lsl	ip, ip, #1
	ldrh	ip, [r7, ip]
	cmp	ip, #0
	beq	.L12
	ldr	ip, [r0, #24]
	add	ip, r2, ip
	sub	ip, ip, #1
	add	r3, r3, ip, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r7, r3]
	cmp	r3, #0
	beq	.L12
	ldr	r3, [r5]
	add	r4, r4, r6
	cmp	r3, #15
	str	r4, [r0, #4]
	bgt	.L12
	ldr	ip, [r0, #16]
	cmp	ip, #120
	addgt	r6, r6, r3
	strgt	r6, [r5]
	b	.L12
.L19:
	mov	r3, #0
	ldr	r2, [r0]
	str	r3, [r0, #44]
	b	.L20
.L52:
	ldr	r3, [r0, #24]
	add	r3, r2, r3
	sub	r3, r3, #1
	add	r3, ip, r3, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r5, r3]
	cmp	r3, #0
	ldr	r5, .L58+12
	beq	.L11
	ldr	r3, [r5]
	cmp	r3, #0
	str	ip, [r0, #4]
	ble	.L22
	ldr	r4, [r0, #16]
	cmp	r4, #119
	suble	r3, r3, r6
	movle	r4, ip
	strle	r3, [r5]
	ble	.L11
.L22:
	mov	r4, ip
	b	.L11
.L59:
	.align	2
.L58:
	.word	player
	.word	67109120
	.word	collisionMapBitmap
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	-6144
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
	ldr	r1, .L64
	ldr	r2, .L64+4
	ldr	r3, .L64+8
	ldr	r6, [r1]
	ldr	r5, [r2]
	ldr	ip, .L64+12
	ldr	r4, .L64+16
	add	lr, r3, #128
.L61:
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
	bne	.L61
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	hOff
	.word	vOff
	.word	gems
	.word	shadowOAM
	.word	511
	.size	updateGame, .-updateGame
	.align	2
	.global	alignMe
	.syntax unified
	.arm
	.fpu softvfp
	.type	alignMe, %function
alignMe:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	alignMe, .-alignMe
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
	ldr	r3, .L69
	ldr	ip, .L69+4
	ldr	r2, [r3]
	ldr	r1, [r0, #4]
	ldr	ip, [ip]
	ldr	r3, [r0]
	sub	r1, r1, r2
	ldr	lr, .L69+8
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
.L70:
	.align	2
.L69:
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
	ldr	ip, .L73
	push	{r4, r5, r6, lr}
	ldr	r3, [ip, #16]
	ldr	lr, .L73+4
	and	r3, r3, lr
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r5, #8
	ldr	r4, .L73+8
	ldr	r0, .L73+12
	ldr	r1, [ip, #32]
	ldr	r2, [r0, #4]
	ldrb	ip, [ip, #12]	@ zero_extendqisi2
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
	ldr	r1, .L73+16
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L73+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L73+24
	ldrh	r1, [r2]
	ldr	r2, .L73+28
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L74:
	.align	2
.L73:
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
	ldr	r0, .L76
	ldr	r3, [r0, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #32]
	ldr	r2, .L76+4
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L77:
	.align	2
.L76:
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
	ldr	r1, .L80
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L80+4
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
.L81:
	.align	2
.L80:
	.word	gem
	.word	shadowOAM
	.size	drawGem, .-drawGem
	.comm	gem,32,4
	.comm	gems,128,4
	.comm	player,56,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
