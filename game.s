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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGems.part.0, %function
updateGems.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r4, r0
	ldr	r1, .L11
	ldr	r2, .L11+4
	ldr	r3, [r0]
	ldr	r0, [r1]
	ldr	r2, [r2]
	ldr	r1, [r4, #4]
	sub	r3, r3, r0
	sub	r1, r1, r2
	cmp	r3, #160
	str	r3, [r4, #8]
	str	r1, [r4, #12]
	sub	sp, sp, #20
	bgt	.L2
	ldr	ip, [r4, #20]
	cmn	r3, ip
	bpl	.L3
.L2:
	mov	r1, #512
	ldr	r3, [r4, #28]
	ldr	r2, .L11+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L3:
	ldr	lr, .L11+12
	add	r0, lr, #16
	ldm	r0, {r0, r2}
	str	ip, [sp, #12]
	ldr	ip, [r4, #16]
	stm	sp, {r1, r3}
	add	r2, r2, r2, lsr #31
	ldr	r3, [lr, #24]
	ldr	r1, [lr, #12]
	ldr	r5, .L11+16
	str	ip, [sp, #8]
	asr	r2, r2, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L5
	mov	r1, #0
	ldr	r2, .L11+20
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	str	r1, [r4, #24]
.L5:
	mov	r0, #8
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #28]
	ldr	r1, .L11+8
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r2, r2, #23
	lsl	ip, r3, #3
	lsr	r2, r2, #23
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, ip]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	gemsRemaining
	.size	updateGems.part.0, .-updateGems.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWolves.part.0, %function
updateWolves.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	ldr	r1, .L46
	ldr	r3, .L46+4
	ldr	r2, [r0, #32]
	ldr	ip, [r1]
	ldr	r0, [r0, #4]
	ldr	r3, [r3]
	ldr	r1, [r4]
	add	r2, r2, #1
	sub	ip, r0, ip
	sub	r3, r1, r3
	cmp	r2, #1
	str	r2, [r4, #32]
	str	ip, [r4, #12]
	str	r3, [r4, #8]
	sub	sp, sp, #16
	beq	.L42
.L14:
	cmp	r3, #160
	bgt	.L22
	ldr	r1, [r4, #20]
	cmn	r3, r1
	bpl	.L23
.L22:
	mov	r1, #512
	ldr	r3, [r4, #28]
	ldr	r2, .L46+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	ldr	lr, .L46+12
	add	r0, r1, r1, lsr #31
	ldr	r2, [lr, #20]
	add	r3, r3, r0, asr #1
	ldr	r0, [lr, #16]
	str	r1, [sp, #12]
	ldr	r5, [r4, #16]
	str	ip, [sp]
	str	r3, [sp, #4]
	add	r2, r2, r2, lsr #31
	ldr	r3, [lr, #24]
	asr	r2, r2, #1
	ldr	r1, [lr, #12]
	add	r0, r0, #8
	str	r5, [sp, #8]
	ldr	r5, .L46+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r2, .L46+20
	ldrne	r3, [r2]
	subne	r3, r3, #1
	strne	r3, [r2]
	ldr	r3, [r4, #12]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r4, #28]
	ldr	r1, .L46+8
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	ldr	r0, .L46+24
	lsl	ip, r2, #3
	add	r2, r1, r2, lsl #3
	strh	lr, [r1, ip]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L42:
	ldr	r2, [r4, #48]
	cmp	r2, #1
	beq	.L43
	cmp	r2, #0
	beq	.L18
.L19:
	mov	r2, #0
	str	r2, [r4, #32]
	b	.L14
.L43:
	ldr	r2, [r4, #16]
	add	r2, r0, r2
	cmp	r2, #256
	bgt	.L16
	ldr	r6, [r4, #20]
	ldr	r5, [r4, #44]
	sub	r2, r2, #1
	add	lr, r6, r6, lsr #31
	add	r2, r2, r5
	add	lr, r1, lr, asr #1
	ldr	r5, .L46+28
	add	lr, r2, lr, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	bne	.L44
.L16:
	mov	r2, #0
	str	r2, [r4, #48]
.L18:
	cmp	r0, #0
	blt	.L20
	ldr	r6, [r4, #20]
	ldr	lr, [r4, #44]
	add	r2, r6, r6, lsr #31
	add	r2, r1, r2, asr #1
	sub	lr, r0, lr
	ldr	r5, .L46+28
	add	r2, lr, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	beq	.L20
	add	r1, r1, r6
	sub	r1, r1, #1
	add	r1, lr, r1, lsl #8
	lsl	r2, r1, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	bne	.L45
.L20:
	mov	r2, #1
	str	r2, [r4, #48]
	mov	r2, #0
	str	r2, [r4, #32]
	b	.L14
.L44:
	add	lr, r1, r6
	sub	lr, lr, #1
	add	r2, r2, lr, lsl #8
	lsl	lr, r2, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	beq	.L16
	add	r2, r2, #256
	lsl	r2, r2, #1
	ldrh	r2, [r5, r2]
	cmp	r2, #0
	addeq	r2, r0, #1
	streq	r2, [r4, #4]
	beq	.L19
	b	.L16
.L45:
	add	r1, r1, #256
	lsl	r1, r1, #1
	ldrh	r2, [r5, r1]
	cmp	r2, #0
	subeq	r2, r0, #1
	streq	r2, [r4, #4]
	beq	.L19
	b	.L20
.L47:
	.align	2
.L46:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	livesRemaining
	.word	4100
	.word	collisionMapBitmap
	.size	updateWolves.part.0, .-updateWolves.part.0
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #104
	mov	fp, #464
	ldr	r4, .L50
	mov	r3, #16384
	mov	r0, #3
	ldr	r2, .L50+4
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	ldr	r5, .L50+12
	mov	r0, #3
	ldr	r2, .L50+16
	ldr	r1, .L50+20
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+24
	mov	lr, pc
	bx	r3
	ldr	lr, [r5]
	ldr	r2, .L50+28
	mov	r0, #32
	mov	ip, #0
	mov	r7, #2
	mov	r10, #475136
	add	lr, lr, r6
	stm	r2, {fp, lr}
	mov	lr, #4
	str	r7, [r2, #52]
	str	r10, [r2, #8]
	str	r0, [r2, #20]
	str	r0, [r2, #24]
	str	ip, [r2, #28]
	str	ip, [r2, #32]
	str	ip, [r2, #48]
	str	ip, [r2, #44]
	ldr	r2, .L50+32
	str	lr, [r2, #124]
	mov	lr, #240
	str	lr, [r2, #36]
	mov	lr, #176
	mov	r1, #8
	str	lr, [r2, #32]
	mov	lr, #128
	mov	r3, #1
	mov	r4, #16
	str	lr, [r2, #68]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	str	r1, [r2, #48]
	str	r1, [r2, #52]
	str	r1, [r2, #80]
	str	r1, [r2, #84]
	str	r1, [r2, #112]
	str	r1, [r2, #116]
	mov	r9, #3
	mov	lr, #56
	mov	r1, #256
	str	r7, [r2, #60]
	str	r9, [r2, #92]
	str	lr, [r2, #64]
	str	r3, [r2, #28]
	str	r3, [r2, #24]
	str	r3, [r2, #56]
	str	r3, [r2, #88]
	str	r6, [r2, #4]
	str	r6, [r2]
	str	r4, [r2, #100]
	str	r1, [r2, #96]
	mov	r1, #5
	str	r3, [r2, #120]
	ldr	r2, .L50+36
	str	r1, [r2, #28]
	mov	r1, #6
	str	r1, [r2, #80]
	mov	r1, #96
	mov	r8, #352
	str	r1, [r2, #56]
	mov	r1, #152
	str	r3, [r2, #24]
	str	r3, [r2, #44]
	str	r3, [r2, #48]
	str	r3, [r2, #76]
	str	r3, [r2, #96]
	str	r3, [r2, #100]
	ldr	r3, .L50+40
	str	ip, [r5]
	str	r4, [r2, #4]
	str	r8, [r3]
	str	r0, [r2, #16]
	str	r0, [r2, #20]
	str	r0, [r2]
	str	r0, [r2, #68]
	str	r0, [r2, #72]
	str	r1, [r2, #52]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L51:
	.align	2
.L50:
	.word	DMANow
	.word	100728832
	.word	FinalGameSpritesTiles
	.word	hOff
	.word	83886592
	.word	FinalGameSpritesPal
	.word	hideSprites
	.word	player
	.word	gems
	.word	wolves
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
	@ link register save eliminated.
	mov	r3, #8
	add	r2, r1, #1
	cmp	r1, #0
	str	r2, [r0, #28]
	str	r3, [r0, #16]
	str	r3, [r0, #20]
	bne	.L53
	mov	r3, #104
	str	r3, [r0, #4]
	str	r3, [r0]
.L54:
	mov	r3, #1
	str	r3, [r0, #24]
	bx	lr
.L53:
	cmp	r1, #1
	beq	.L57
	cmp	r1, #2
	beq	.L58
	cmp	r1, #3
	moveq	r2, #256
	moveq	r3, #16
	stmeq	r0, {r2, r3}
	b	.L54
.L57:
	mov	r2, #176
	mov	r3, #240
	stm	r0, {r2, r3}
	b	.L54
.L58:
	mov	r2, #56
	mov	r3, #128
	stm	r0, {r2, r3}
	b	.L54
	.size	initGems, .-initGems
	.align	2
	.global	initWolves
	.syntax unified
	.arm
	.fpu softvfp
	.type	initWolves, %function
initWolves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	mov	r2, #32
	add	ip, r1, #5
	cmp	r1, #0
	str	ip, [r0, #28]
	str	r3, [r0, #24]
	str	r3, [r0, #44]
	str	r3, [r0, #48]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	bne	.L60
	mov	r3, #16
	stm	r0, {r2, r3}
	bx	lr
.L60:
	cmp	r1, #1
	moveq	r2, #152
	moveq	r3, #96
	stmeq	r0, {r2, r3}
	bx	lr
	.size	initWolves, .-initWolves
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
	ldr	r0, .L140
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
	ldr	lr, .L140+4
	ldrh	lr, [lr, #48]
	asr	ip, ip, #10
	asr	r3, r3, #10
	tst	lr, #32
	str	ip, [r0]
	str	r3, [r0, #48]
	bne	.L136
	ldr	lr, [r0, #4]
	cmn	lr, #7
	bge	.L128
.L136:
	ldr	r7, .L140+8
.L64:
	ldr	lr, .L140+4
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L67
	ldr	r6, [r0, #4]
	cmp	r6, #231
	ble	.L137
.L67:
	ldr	lr, .L140+12
	cmn	r2, #1024
	ldr	r5, [lr]
	ble	.L69
	cmp	r5, #0
	ble	.L70
	ldr	r1, [r0, #12]
	cmp	r1, #43
	bgt	.L70
	sub	r5, r5, r3
	cmp	r3, #0
	str	r5, [lr]
	beq	.L71
	cmp	r5, #352
	bge	.L75
.L77:
	ldr	r5, [lr]
.L78:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [lr]
	b	.L80
.L137:
	ldr	lr, [r0, #20]
	ldr	r5, [r0, #52]
	add	lr, r6, lr
	sub	lr, lr, #9
	add	lr, lr, r5
	ldr	r8, .L140+16
	add	r4, lr, ip, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r8, r4]
	cmp	r4, #0
	beq	.L67
	ldr	r4, [r0, #24]
	add	r4, ip, r4
	sub	r4, r4, #1
	add	lr, lr, r4, lsl #8
	lsl	r4, lr, #1
	ldrh	lr, [r8, r4]
	cmp	lr, #0
	beq	.L67
	ldr	r4, [r7]
	add	lr, r6, r5
	cmp	r4, #15
	str	lr, [r0, #4]
	bgt	.L67
	ldr	lr, [r0, #16]
	cmp	lr, #120
	addgt	r5, r5, r4
	strgt	r5, [r7]
	b	.L67
.L128:
	ldr	r6, [r0, #52]
	add	r4, lr, #8
	sub	r4, r4, r6
	ldr	r7, .L140+16
	add	r5, r4, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L136
	ldr	r5, [r0, #24]
	add	r5, ip, r5
	sub	r5, r5, #1
	add	r4, r4, r5, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	ldr	r7, .L140+8
	beq	.L64
	ldr	r4, [r7]
	sub	lr, lr, r6
	cmp	r4, #0
	str	lr, [r0, #4]
	ble	.L64
	ldr	lr, [r0, #16]
	cmp	lr, #119
	suble	r4, r4, r6
	strle	r4, [r7]
	b	.L64
.L70:
	cmp	r3, #0
	bne	.L73
	ldr	r1, [r0, #12]
	cmp	r1, #63
	ble	.L71
.L73:
	cmp	r5, #352
	blt	.L74
.L75:
	cmp	r5, #352
	movne	r5, #352
	strne	r5, [lr]
.L80:
	ldr	r1, [r0, #24]
	ldr	r6, [r0, #4]
	ldr	r3, .L140+16
	add	r1, ip, r1
	add	r4, r6, r1, lsl #8
	add	lr, r3, r4, lsl #1
	ldrh	lr, [lr, #16]
	cmp	lr, #0
	ldr	lr, [r0, #20]
	beq	.L81
	add	r4, r4, lr
	add	r4, r3, r4, lsl #1
	ldrh	r4, [r4, #-18]
	cmp	r4, #0
	bne	.L138
.L81:
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
	b	.L83
.L84:
	mov	r8, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L83:
	add	r1, lr, r3
	ldrh	r1, [r1, r4]
	cmp	r1, #0
	beq	.L84
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L84
	ldr	r3, .L140+20
	ldrh	r3, [r3]
	cmp	r8, #0
	movne	ip, r2
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L86
	ldr	r3, .L140+24
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L139
.L86:
	mov	r3, #0
	str	r3, [r0, #44]
.L88:
	ldr	r3, [r7]
	sub	ip, ip, r5
	sub	r6, r6, r3
	str	r6, [r0, #16]
	str	ip, [r0, #12]
	str	r1, [r0, #8]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L69:
	add	r2, r2, #500
	str	r2, [r0, #44]
	ldr	r6, [r0, #4]
	add	r1, r1, r2
	b	.L88
.L74:
	ldr	r1, [r0, #12]
	cmp	r1, #84
	ble	.L76
	add	r5, r5, r3
	cmp	r5, #352
	str	r5, [lr]
	bge	.L75
.L76:
	cmp	r1, #64
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #0
	moveq	r3, r1
	movne	r3, #0
	cmp	r3, #0
	addne	r5, r5, #1
	strne	r5, [lr]
	beq	.L77
	b	.L78
.L138:
	ldr	r3, [r0, #8]
	add	r1, r2, #500
	str	r1, [r0, #44]
	add	r1, r1, r3
	b	.L88
.L139:
	cmp	r2, #0
	ldrgt	r3, .L140+28
	ldrle	r3, [r0, #44]
	strgt	r3, [r0, #44]
	addle	r1, r1, r3
	addgt	r1, r1, r3
	b	.L88
.L71:
	cmp	r5, #0
	ble	.L74
	sub	r5, r5, #1
	str	r5, [lr]
	b	.L73
.L141:
	.align	2
.L140:
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
	bl	updatePlayer
	mov	r7, #512
	ldr	r4, .L153
	ldr	r6, .L153+4
	add	r5, r4, #128
.L145:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L143
	mov	r0, r4
	bl	updateGems.part.0
.L144:
	add	r4, r4, #32
	cmp	r4, r5
	bne	.L145
	ldr	r4, .L153+8
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L146
	mov	r1, #512
	ldr	r3, [r4, #28]
	ldr	r2, .L153+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
.L147:
	ldr	r3, [r4, #76]
	cmp	r3, #0
	bne	.L148
	mov	r1, #512
	ldr	r3, [r4, #80]
	ldr	r2, .L153+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L143:
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r7, [r6, r3]	@ movhi
	b	.L144
.L148:
	ldr	r0, .L153+12
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateWolves.part.0
.L146:
	mov	r0, r4
	bl	updateWolves.part.0
	b	.L147
.L154:
	.align	2
.L153:
	.word	gems
	.word	shadowOAM
	.word	wolves
	.word	wolves+52
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
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	cmp	r2, #0
	bne	updateGems.part.0
.L156:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L157
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L158:
	.align	2
.L157:
	.word	shadowOAM
	.size	updateGems, .-updateGems
	.align	2
	.global	updateWolves
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWolves, %function
updateWolves:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #24]
	cmp	r2, #0
	bne	updateWolves.part.0
.L160:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L161
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L162:
	.align	2
.L161:
	.word	shadowOAM
	.size	updateWolves, .-updateWolves
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
	ldr	r1, .L165
	ldr	r3, [r1, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r1, #32]
	push	{r4, lr}
	ldrb	r0, [r1, #12]	@ zero_extendqisi2
	ldr	r4, .L165+4
	lsl	r2, r2, #2
	strh	r3, [r4, #2]	@ movhi
	strh	r0, [r4]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	ldr	r1, .L165+8
	mov	lr, pc
	bx	r1
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r4, .L165+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L165+16
	ldrh	r1, [r2]
	ldr	r2, .L165+20
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L166:
	.align	2
.L165:
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
	ldr	r0, .L168
	ldr	r3, [r0, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r1, [r0, #32]
	ldr	r2, .L168+4
	ldrb	r0, [r0, #12]	@ zero_extendqisi2
	lsl	r1, r1, #2
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L169:
	.align	2
.L168:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.comm	wolves,104,4
	.comm	blocks,160,4
	.comm	gems,128,4
	.comm	player,56,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
