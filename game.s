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
	ldr	r0, .L88
	ldr	r1, [r0, #8]
	ldr	r2, [r0, #44]
	cmp	r1, #0
	add	ip, r1, #1020
	add	ip, ip, #3
	add	r3, r2, #1020
	movge	ip, r1
	cmp	r2, #0
	add	r3, r3, #3
	movge	r3, r2
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L88+4
	ldrh	lr, [lr, #48]
	asr	ip, ip, #10
	asr	r3, r3, #10
	tst	lr, #32
	str	ip, [r0]
	str	r3, [r0, #48]
	bne	.L84
	ldr	lr, [r0, #4]
	cmn	lr, #7
	bge	.L76
.L84:
	ldr	r7, .L88+8
.L12:
	ldr	lr, .L88+4
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L15
	ldr	r6, [r0, #4]
	cmp	r6, #231
	ble	.L85
.L15:
	ldr	lr, .L88+12
	cmn	r2, #1024
	ldr	r5, [lr]
	ble	.L17
	cmp	r5, #0
	ble	.L18
	ldr	r1, [r0, #12]
	cmp	r1, #43
	bgt	.L18
	sub	r5, r5, r3
	cmp	r3, #0
	str	r5, [lr]
	beq	.L19
	cmp	r5, #352
	bge	.L23
.L25:
	ldr	r5, [lr]
.L26:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [lr]
	b	.L28
.L85:
	ldr	lr, [r0, #20]
	ldr	r5, [r0, #52]
	add	lr, r6, lr
	sub	lr, lr, #9
	add	lr, lr, r5
	ldr	r8, .L88+16
	add	r4, lr, ip, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r8, r4]
	cmp	r4, #0
	beq	.L15
	ldr	r4, [r0, #24]
	add	r4, ip, r4
	sub	r4, r4, #1
	add	lr, lr, r4, lsl #8
	lsl	r4, lr, #1
	ldrh	lr, [r8, r4]
	cmp	lr, #0
	beq	.L15
	ldr	r4, [r7]
	add	lr, r6, r5
	cmp	r4, #15
	str	lr, [r0, #4]
	bgt	.L15
	ldr	lr, [r0, #16]
	cmp	lr, #120
	addgt	r5, r5, r4
	strgt	r5, [r7]
	b	.L15
.L76:
	ldr	r6, [r0, #52]
	add	r4, lr, #8
	sub	r4, r4, r6
	ldr	r7, .L88+16
	add	r5, r4, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L84
	ldr	r5, [r0, #24]
	add	r5, ip, r5
	sub	r5, r5, #1
	add	r4, r4, r5, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	ldr	r7, .L88+8
	beq	.L12
	ldr	r4, [r7]
	sub	lr, lr, r6
	cmp	r4, #0
	str	lr, [r0, #4]
	ble	.L12
	ldr	lr, [r0, #16]
	cmp	lr, #119
	suble	r4, r4, r6
	strle	r4, [r7]
	b	.L12
.L18:
	cmp	r3, #0
	bne	.L21
	ldr	r1, [r0, #12]
	cmp	r1, #63
	ble	.L19
.L21:
	cmp	r5, #352
	blt	.L22
.L23:
	cmp	r5, #352
	movne	r5, #352
	strne	r5, [lr]
.L28:
	ldr	r1, [r0, #24]
	ldr	r6, [r0, #4]
	ldr	r3, .L88+16
	add	r1, ip, r1
	add	r4, r6, r1, lsl #8
	add	lr, r3, r4, lsl #1
	ldrh	lr, [lr, #16]
	cmp	lr, #0
	ldr	lr, [r0, #20]
	beq	.L29
	add	r4, r4, lr
	add	r4, r3, r4, lsl #1
	ldrh	r4, [r4, #-18]
	cmp	r4, #0
	bne	.L86
.L29:
	add	lr, lr, r6
	sub	r4, lr, #264
	sub	r4, r4, #-2147483647
	add	r1, r4, r1, lsl #8
	rsb	lr, lr, lr, lsl #31
	lsl	r4, r6, #1
	mov	r2, ip
	mov	r8, #0
	add	r3, r3, r1, lsl #1
	lsl	lr, lr, #1
	add	r4, r4, #34
	b	.L31
.L32:
	mov	r8, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L31:
	add	r1, lr, r3
	ldrh	r1, [r1, r4]
	cmp	r1, #0
	beq	.L32
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L32
	ldr	r3, .L88+20
	ldrh	r3, [r3]
	cmp	r8, #0
	movne	ip, r2
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L34
	ldr	r3, .L88+24
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L87
.L34:
	mov	r3, #0
	str	r3, [r0, #44]
.L36:
	ldr	r3, [r7]
	sub	ip, ip, r5
	sub	r6, r6, r3
	str	r6, [r0, #16]
	str	ip, [r0, #12]
	str	r1, [r0, #8]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L17:
	add	r2, r2, #500
	str	r2, [r0, #44]
	ldr	r6, [r0, #4]
	add	r1, r1, r2
	b	.L36
.L22:
	ldr	r1, [r0, #12]
	cmp	r1, #84
	ble	.L24
	add	r5, r5, r3
	cmp	r5, #352
	str	r5, [lr]
	bge	.L23
.L24:
	cmp	r1, #64
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #0
	moveq	r3, r1
	movne	r3, #0
	cmp	r3, #0
	addne	r5, r5, #1
	strne	r5, [lr]
	beq	.L25
	b	.L26
.L86:
	ldr	r3, [r0, #8]
	add	r1, r2, #500
	str	r1, [r0, #44]
	add	r1, r1, r3
	b	.L36
.L87:
	cmp	r2, #0
	ldrgt	r3, .L88+28
	ldrle	r3, [r0, #44]
	strgt	r3, [r0, #44]
	addle	r1, r1, r3
	addgt	r1, r1, r3
	b	.L36
.L19:
	cmp	r5, #0
	ble	.L22
	sub	r5, r5, #1
	str	r5, [lr]
	b	.L21
.L89:
	.align	2
.L88:
	.word	player
	.word	67109120
	.word	hOff
	.word	vOff
	.word	collisionMapBitmap
	.word	oldButtons
	.word	buttons
	.word	-6144
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
	ldr	r1, .L94
	ldr	r2, .L94+4
	ldr	r3, .L94+8
	ldr	r6, [r1]
	ldr	r5, [r2]
	ldr	ip, .L94+12
	ldr	r4, .L94+16
	add	lr, r3, #128
.L91:
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
	bne	.L91
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L95:
	.align	2
.L94:
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
	ldr	r3, .L98
	ldr	ip, .L98+4
	ldr	r2, [r3]
	ldr	r1, [r0, #4]
	ldr	ip, [ip]
	ldr	r3, [r0]
	sub	r1, r1, r2
	ldr	lr, .L98+8
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
.L99:
	.align	2
.L98:
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
	ldr	ip, .L102
	push	{r4, r5, r6, lr}
	ldr	r3, [ip, #16]
	ldr	lr, .L102+4
	and	r3, r3, lr
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	mov	r5, #8
	ldr	r4, .L102+8
	ldr	r0, .L102+12
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
	ldr	r1, .L102+16
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L102+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L102+24
	ldrh	r1, [r2]
	ldr	r2, .L102+28
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L103:
	.align	2
.L102:
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
	ldr	r0, .L105
	ldr	r3, [r0, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #32]
	ldr	r2, .L105+4
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L106:
	.align	2
.L105:
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
	ldr	r1, .L109
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L109+4
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
.L110:
	.align	2
.L109:
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
