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
	ldr	r1, .L12
	ldr	r2, .L12+4
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
	ldr	r2, .L12+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L3:
	ldr	lr, .L12+12
	add	r0, lr, #16
	ldm	r0, {r0, r2}
	str	ip, [sp, #12]
	ldr	ip, [r4, #16]
	stm	sp, {r1, r3}
	add	r2, r2, r2, lsr #31
	ldr	r3, [lr, #24]
	ldr	r1, [lr, #12]
	ldr	r5, .L12+16
	str	ip, [sp, #8]
	asr	r2, r2, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L11
.L5:
	mov	r0, #16
	ldr	r2, [r4, #12]
	ldr	r3, [r4, #28]
	ldr	r1, .L12+8
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
.L11:
	mov	r3, #0
	ldr	lr, .L12+20
	ldr	ip, [lr]
	str	r3, [r4, #24]
	sub	ip, ip, #1
	ldr	r2, .L12+24
	ldr	r1, .L12+28
	ldr	r0, .L12+32
	ldr	r5, .L12+36
	str	ip, [lr]
	mov	lr, pc
	bx	r5
	b	.L5
.L13:
	.align	2
.L12:
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	gemsRemaining
	.word	11025
	.word	4008
	.word	GemCollectSound
	.word	playSoundB
	.size	updateGems.part.0, .-updateGems.part.0
	.global	__aeabi_idivmod
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateWolves.part.0, %function
updateWolves.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, .L51
	ldr	r2, .L51+4
	ldr	r9, .L51+8
	ldr	r6, [r0, #64]
	ldr	r5, [r3]
	ldr	r10, [r0, #4]
	ldr	r8, [r2]
	ldr	fp, [r0]
	ldr	r7, [r0, #32]
	ldr	r3, [r9, #32]
	add	r6, r6, #1
	sub	r8, r10, r8
	sub	r5, fp, r5
	tst	r7, #7
	mov	r4, r0
	str	r3, [r0, #40]
	str	r6, [r0, #64]
	str	r8, [r0, #12]
	str	r5, [r0, #8]
	sub	sp, sp, #20
	bne	.L15
	ldr	r0, [r0, #48]
	ldr	r3, .L51+12
	ldr	r1, [r4, #44]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #48]
.L15:
	add	r7, r7, #1
	cmp	r6, #1
	str	r7, [r4, #32]
	beq	.L47
.L16:
	cmp	r5, #160
	bgt	.L24
	ldr	r3, [r4, #20]
	cmn	r5, r3
	bpl	.L25
.L24:
	mov	r1, #512
	ldr	r3, [r4, #28]
	ldr	r2, .L51+16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L25:
	add	r1, r3, r3, lsr #31
	ldr	r2, [r9, #20]
	add	r5, r5, r1, asr #1
	ldr	r0, [r9, #16]
	ldr	r1, [r4, #16]
	add	r2, r2, r2, lsr #31
	str	r3, [sp, #12]
	str	r5, [sp, #4]
	str	r1, [sp, #8]
	str	r8, [sp]
	ldr	r3, [r9, #24]
	ldr	r1, [r9, #12]
	ldr	r5, .L51+20
	asr	r2, r2, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	streq	r0, [r4, #60]
	beq	.L30
	ldr	r2, [r9, #68]
	ldr	r3, [r4, #60]
	orrs	r3, r3, r2
	bne	.L28
	ldr	lr, .L51+24
	ldr	r2, [lr]
	rsb	r1, r2, #3
	cmp	r1, #0
	cmpge	r2, #0
	ldrgt	r0, .L51+28
	addgt	r1, r1, r1, lsl #1
	addgt	r1, r0, r1, lsl #3
	strgt	r3, [r1, #20]
	sub	ip, r2, #1
	mov	r3, #0
	ldr	r2, .L51+32
	ldr	r1, .L51+36
	ldr	r0, .L51+40
	ldr	r5, .L51+44
	str	ip, [lr]
	mov	lr, pc
	bx	r5
.L28:
	mov	r3, #1
	str	r3, [r4, #60]
.L30:
	ldr	r2, [r4, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r3, [r4, #36]
	ldr	ip, [r4, #48]
	add	r3, r3, #2
	ldr	r1, [r4, #28]
	ldr	r0, .L51+16
	add	r3, r3, ip, lsl #5
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	lsl	r3, r3, #2
	lsl	ip, r1, #3
	orr	r3, r3, #4096
	add	r1, r0, r1, lsl #3
	strh	lr, [r0, ip]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L47:
	ldr	r3, [r4, #56]
	cmp	r3, #1
	beq	.L48
	cmp	r3, #0
	beq	.L20
.L21:
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L16
.L48:
	ldr	r3, [r4, #16]
	add	r3, r10, r3
	cmp	r3, #256
	str	r6, [r4, #36]
	bgt	.L18
	ldr	r1, [r4, #20]
	ldr	r0, [r4, #52]
	sub	r3, r3, #1
	add	r2, r1, r1, lsr #31
	add	r3, r3, r0
	add	r2, fp, r2, asr #1
	ldr	r0, .L51+48
	add	r2, r3, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	bne	.L49
.L18:
	mov	r3, #0
	str	r3, [r4, #56]
.L20:
	mov	r3, #0
	cmp	r10, r3
	str	r3, [r4, #36]
	blt	.L22
	ldr	r0, [r4, #20]
	ldr	r2, [r4, #52]
	add	r3, r0, r0, lsr #31
	add	r3, fp, r3, asr #1
	sub	r2, r10, r2
	ldr	r1, .L51+48
	add	r3, r2, r3, lsl #8
	lsl	r3, r3, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	beq	.L22
	add	fp, fp, r0
	sub	fp, fp, #1
	add	fp, r2, fp, lsl #8
	lsl	r3, fp, #1
	ldrh	r3, [r1, r3]
	cmp	r3, #0
	bne	.L50
.L22:
	mov	r3, #1
	str	r3, [r4, #56]
	mov	r3, #0
	str	r3, [r4, #64]
	b	.L16
.L49:
	add	r2, fp, r1
	sub	r2, r2, #1
	add	r3, r3, r2, lsl #8
	lsl	r2, r3, #1
	ldrh	r2, [r0, r2]
	cmp	r2, #0
	beq	.L18
	add	r3, r3, #256
	lsl	r3, r3, #1
	ldrh	r3, [r0, r3]
	cmp	r3, #0
	addeq	r10, r10, #1
	streq	r10, [r4, #4]
	beq	.L21
	b	.L18
.L50:
	add	fp, fp, #256
	lsl	r2, fp, #1
	ldrh	r3, [r1, r2]
	cmp	r3, #0
	subeq	r10, r10, #1
	streq	r10, [r4, #4]
	beq	.L21
	b	.L22
.L52:
	.align	2
.L51:
	.word	vOff
	.word	hOff
	.word	player
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	collision
	.word	livesRemaining
	.word	hearts
	.word	11025
	.word	1402
	.word	HurtSound
	.word	playSoundB
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
	mov	r5, #3
	mov	r4, #4
	mov	fp, #240
	mov	r7, #104
	mov	r0, r5
	ldr	r6, .L55
	mov	r3, #16384
	ldr	r2, .L55+4
	ldr	r1, .L55+8
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #256
	ldr	r2, .L55+12
	ldr	r1, .L55+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L55+20
	ldr	r1, .L55+24
	ldr	r2, .L55+28
	ldr	r3, .L55+32
	str	r4, [r0]
	str	r4, [r1]
	str	r5, [r2]
	ldr	r9, .L55+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+40
	str	r5, [r3, #92]
	ldr	r5, [r9]
	str	fp, [r3, #36]
	ldr	fp, .L55+44
	add	r5, r5, r7
	str	r5, [fp, #4]
	mov	r5, #464
	str	r5, [fp]
	mov	r5, #475136
	mov	r2, #8
	mov	r1, #1
	mov	r0, #0
	mov	ip, #32
	mov	r6, #5
	mov	r8, #2
	str	r5, [fp, #8]
	mov	r5, #176
	str	r4, [r3, #124]
	str	r8, [r3, #60]
	str	r0, [fp, #28]
	str	r0, [fp, #40]
	str	r0, [fp, #32]
	str	r0, [fp, #56]
	str	r0, [fp, #52]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #48]
	str	r2, [r3, #52]
	str	r2, [r3, #80]
	str	r2, [r3, #84]
	str	r2, [r3, #112]
	str	r2, [r3, #116]
	str	r7, [r3, #4]
	str	r7, [r3]
	str	ip, [fp, #20]
	str	ip, [fp, #24]
	str	r6, [fp, #48]
	str	r8, [fp, #60]
	str	r1, [fp, #64]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r1, [r3, #56]
	str	r1, [r3, #88]
	str	r5, [r3, #32]
	mov	r5, #56
	str	r5, [r3, #64]
	mov	r5, #256
	str	r5, [r3, #96]
	ldr	r5, .L55+48
	str	r4, [r5, #44]
	str	r4, [r5, #112]
	mov	r4, #6
	str	r4, [r5, #96]
	mov	r4, #96
	mov	r7, #16
	str	r4, [r5, #72]
	mov	r4, #152
	mov	r10, #128
	str	r6, [r5, #28]
	str	r0, [r5, #60]
	str	r0, [r5, #128]
	str	r4, [r5, #68]
	str	r7, [r5, #4]
	str	r1, [r5, #24]
	str	ip, [r5, #16]
	str	ip, [r5, #20]
	str	r1, [r5, #52]
	str	r1, [r5, #56]
	str	ip, [r5]
	str	r1, [r5, #92]
	str	ip, [r5, #84]
	str	ip, [r5, #88]
	str	r1, [r5, #120]
	str	r1, [r5, #124]
	mov	r5, #7
	mov	lr, #144
	str	r7, [r3, #100]
	str	r10, [r3, #68]
	str	r1, [r3, #120]
	ldr	r3, .L55+52
	str	r5, [r3, #28]
	mov	r5, #18
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #4]
	str	lr, [r3]
	ldr	r3, .L55+56
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r5, [r3, #4]
	str	lr, [r3]
	str	r2, [r3, #16]
	mov	r3, #64
	ldr	r4, .L55+60
	str	r3, [r4]
	ldr	r3, .L55+64
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #36]
	str	r2, [r3, #32]
	str	r2, [r3, #56]
	str	r2, [r3, #60]
	mov	r2, #224
	str	r2, [r3, #4]
	mov	r2, #9
	str	r2, [r3, #16]
	mov	r2, #208
	str	r2, [r3, #28]
	mov	r2, #10
	str	r2, [r3, #40]
	mov	r2, #192
	str	r2, [r3, #52]
	mov	r2, #11
	str	lr, [r3]
	str	lr, [r3, #24]
	str	lr, [r3, #48]
	str	r1, [r3, #44]
	str	r2, [r3, #64]
	str	r1, [r3, #20]
	str	r1, [r3, #68]
	ldr	r2, .L55+68
	ldr	r3, .L55+72
	str	r2, [r3, #24]
	mov	r2, #12
	str	lr, [r3, #16]
	str	r0, [r3, #40]
	str	r0, [r3, #44]
	str	r0, [r3, #52]
	str	r0, [r3, #48]
	str	r2, [r3, #8]
	str	ip, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #12]
	str	r1, [r3, #36]
	str	ip, [r4, #4]
	str	r0, [r4, #24]
	str	r0, [r9]
	mov	r0, #38
	ldr	r2, .L55+76
	str	r0, [r4, #20]
	str	r1, [r2]
	mov	r0, #13
	mov	r2, #352
	ldr	r3, .L55+80
	str	r10, [r4, #16]
	str	r1, [r4, #12]
	str	r0, [r4, #8]
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	DMANow
	.word	100728832
	.word	FinalGameSpritesTiles
	.word	83886592
	.word	FinalGameSpritesPal
	.word	gemsRemaining
	.word	statueLivesRemaining
	.word	livesRemaining
	.word	hideSprites
	.word	hOff
	.word	gems
	.word	player
	.word	wolves
	.word	gemCounterIcon
	.word	gemNum
	.word	textBubble
	.word	hearts
	.word	442
	.word	statue
	.word	gameState
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
	bne	.L58
	mov	r3, #104
	str	r3, [r0, #4]
	str	r3, [r0]
.L59:
	mov	r3, #1
	str	r3, [r0, #24]
	bx	lr
.L58:
	cmp	r1, #1
	beq	.L62
	cmp	r1, #2
	beq	.L63
	cmp	r1, #3
	moveq	r2, #256
	moveq	r3, #16
	stmeq	r0, {r2, r3}
	b	.L59
.L62:
	mov	r2, #176
	mov	r3, #240
	stm	r0, {r2, r3}
	b	.L59
.L63:
	mov	r2, #56
	mov	r3, #128
	stm	r0, {r2, r3}
	b	.L59
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
	push	{r4, lr}
	mov	lr, #0
	mov	r3, #1
	mov	r2, #32
	mov	ip, #4
	add	r4, r1, #5
	cmp	r1, lr
	str	r4, [r0, #28]
	str	lr, [r0, #60]
	str	ip, [r0, #44]
	str	r3, [r0, #24]
	str	r3, [r0, #52]
	str	r3, [r0, #56]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	bne	.L65
	mov	r3, #16
	pop	{r4, lr}
	stm	r0, {r2, r3}
	bx	lr
.L65:
	cmp	r1, #1
	moveq	r2, #152
	moveq	r3, #96
	pop	{r4, lr}
	stmeq	r0, {r2, r3}
	bx	lr
	.size	initWolves, .-initWolves
	.align	2
	.global	initHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHearts, %function
initHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #8
	str	lr, [sp, #-4]!
	mov	ip, #144
	mov	lr, #1
	rsb	r3, r1, #14
	lsl	r3, r3, #4
	add	r1, r1, #9
	str	lr, [r0, #20]
	str	ip, [r0]
	str	r3, [r0, #4]
	str	r1, [r0, #16]
	str	r2, [r0, #8]
	str	r2, [r0, #12]
	ldr	lr, [sp], #4
	bx	lr
	.size	initHearts, .-initHearts
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #2
	push	{r4, r5, r6, lr}
	ldr	r4, .L90
	ldr	r3, .L90+4
	ldr	r5, [r4, #28]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #1
	ldr	r6, [r4, #32]
	add	r3, r3, r3, lsl r1
	cmp	r5, r3
	str	r6, [r4, #36]
	str	r1, [r4, #32]
	bne	.L71
	ldr	r0, [r4, #40]
	ldr	r3, .L90+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L71:
	ldr	r3, .L90+12
	ldr	r3, [r3]
	cmp	r3, #3
	cmpne	r3, #0
	ldr	r2, [r4, #64]
	bne	.L72
	ldr	r3, .L90+16
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #1
	streq	r3, [r4, #32]
	ldr	r3, .L90+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	streq	r3, [r4, #32]
	ldr	r3, .L90+16
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L89
	mov	r3, #0
	cmp	r2, r3
	str	r3, [r4, #68]
	bne	.L76
	ldr	r3, [r4, #32]
	cmp	r3, #2
	beq	.L83
	cmp	r3, #3
	beq	.L82
	add	r5, r5, #1
	str	r5, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L72:
	cmp	r2, #0
	beq	.L83
.L76:
	mov	r3, #0
	ldr	r1, .L90+16
	ldrh	r1, [r1, #48]
	tst	r1, #32
	str	r3, [r4, #28]
	moveq	r3, #1
	mov	r2, #2
	str	r6, [r4, #32]
	streq	r3, [r4, #32]
	ldr	r3, .L90+16
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	str	r2, [r4, #40]
	streq	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	mov	r3, #1
	cmp	r2, #0
	str	r3, [r4, #68]
	bne	.L76
.L82:
	mov	r2, #5
	mov	r3, #0
	str	r6, [r4, #32]
	str	r2, [r4, #40]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L83:
	mov	r3, #0
	str	r6, [r4, #32]
	str	r3, [r4, #40]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L91:
	.align	2
.L90:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	gameState
	.word	67109120
	.size	animatePlayer, .-animatePlayer
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
	ldr	r0, .L186
	ldr	r1, [r0, #8]
	ldr	r2, [r0, #52]
	push	{r4, r5, r6, r7, r8, lr}
	cmp	r1, #0
	add	lr, r1, #1020
	add	lr, lr, #3
	add	r3, r2, #1020
	movge	lr, r1
	cmp	r2, #0
	add	r3, r3, #3
	movge	r3, r2
	ldr	r4, .L186+4
	ldrh	ip, [r4, #48]
	asr	lr, lr, #10
	asr	r3, r3, #10
	tst	ip, #32
	str	lr, [r0]
	str	r3, [r0, #56]
	bne	.L93
	ldr	ip, [r0, #68]
	cmp	ip, #0
	beq	.L184
.L94:
	ldrh	ip, [r4, #48]
.L182:
	ldr	r7, .L186+8
.L100:
	ldr	ip, .L186+12
	cmn	r2, #1024
	ldr	r5, [ip]
	ble	.L101
	mov	r1, #1
	cmp	r5, #0
	str	r1, [r0, #64]
	ble	.L102
	ldr	r1, [r0, #12]
	cmp	r1, #43
	bgt	.L102
	sub	r5, r5, r3
	cmp	r3, #0
	str	r5, [ip]
	beq	.L103
	cmp	r5, #352
	bge	.L107
.L109:
	ldr	r5, [ip]
.L110:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [ip]
	b	.L112
.L184:
	ldr	ip, .L186+16
	ldr	ip, [ip]
	cmp	ip, #3
	cmpne	ip, #0
	bne	.L94
	ldr	r6, [r0, #4]
	cmn	r6, #7
	blt	.L183
	ldr	r8, [r0, #60]
	add	ip, r6, #8
	sub	ip, ip, r8
	ldr	r7, .L186+20
	add	r5, ip, lr, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L183
	ldr	r5, [r0, #24]
	add	r5, lr, r5
	sub	r5, r5, #1
	add	r5, ip, r5, lsl #8
	lsl	r5, r5, #1
	ldrh	ip, [r7, r5]
	cmp	ip, #0
	ldr	r7, .L186+8
	beq	.L96
	ldr	r5, [r7]
	sub	ip, r6, r8
	cmp	r5, #0
	str	ip, [r0, #4]
	ble	.L96
	ldr	ip, [r0, #16]
	cmp	ip, #119
	bgt	.L96
	ldrh	ip, [r4, #48]
	sub	r5, r5, r8
	tst	ip, #16
	str	r5, [r7]
	bne	.L100
.L97:
	ldr	r6, [r0, #4]
	cmp	r6, #231
	bgt	.L100
	ldr	ip, [r0, #20]
	ldr	r5, [r0, #60]
	add	ip, r6, ip
	sub	ip, ip, #9
	add	ip, ip, r5
	ldr	r8, .L186+20
	add	r4, ip, lr, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r8, r4]
	cmp	r4, #0
	beq	.L100
	ldr	r4, [r0, #24]
	add	r4, lr, r4
	sub	r4, r4, #1
	add	r4, ip, r4, lsl #8
	lsl	r4, r4, #1
	ldrh	ip, [r8, r4]
	cmp	ip, #0
	beq	.L100
	ldr	r4, [r7]
	add	ip, r6, r5
	cmp	r4, #15
	str	ip, [r0, #4]
	bgt	.L100
	ldr	ip, [r0, #16]
	cmp	ip, #120
	addgt	r5, r5, r4
	strgt	r5, [r7]
	b	.L100
.L102:
	cmp	r3, #0
	bne	.L105
	ldr	r1, [r0, #12]
	cmp	r1, #63
	ble	.L103
.L105:
	cmp	r5, #352
	blt	.L106
.L107:
	cmp	r5, #352
	movne	r5, #352
	strne	r5, [ip]
.L112:
	ldr	r1, [r0, #24]
	ldr	r6, [r0, #4]
	ldr	r3, .L186+20
	add	r1, lr, r1
	add	r4, r6, r1, lsl #8
	add	ip, r3, r4, lsl #1
	ldrh	ip, [ip, #16]
	cmp	ip, #0
	ldr	ip, [r0, #20]
	beq	.L113
	add	r4, r4, ip
	add	r4, r3, r4, lsl #1
	ldrh	r4, [r4, #-18]
	cmp	r4, #0
	bne	.L185
.L113:
	add	ip, ip, r6
	sub	r4, ip, #264
	sub	r4, r4, #-2147483647
	add	r1, r4, r1, lsl #8
	rsb	ip, ip, ip, lsl #31
	lsl	r4, r6, #1
	mov	r2, lr
	mov	r8, #0
	add	r3, r3, r1, lsl #1
	lsl	ip, ip, #1
	add	r4, r4, #34
	b	.L115
.L116:
	mov	r8, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L115:
	add	r1, ip, r3
	ldrh	r1, [r1, r4]
	cmp	r1, #0
	beq	.L116
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L116
	ldr	r3, .L186+24
	ldrh	r3, [r3]
	cmp	r8, #0
	movne	lr, r2
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L118
	ldr	r3, .L186+28
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L118
	ldr	r3, .L186+16
	ldr	r3, [r3]
	cmp	r3, #3
	cmpne	r3, #0
	bne	.L118
	cmp	r2, #0
	ldrgt	r3, .L186+32
	ldrle	r3, [r0, #52]
	strgt	r3, [r0, #52]
	addle	r1, r1, r3
	addgt	r1, r1, r3
	b	.L120
.L118:
	mov	r3, #0
	str	r3, [r0, #52]
	str	r3, [r0, #64]
.L120:
	ldr	r3, [r7]
	sub	lr, lr, r5
	sub	r6, r6, r3
	str	r6, [r0, #16]
	str	lr, [r0, #12]
	pop	{r4, r5, r6, r7, r8, lr}
	str	r1, [r0, #8]
	b	animatePlayer
.L93:
	ldrh	ip, [r4, #48]
	tst	ip, #16
	bne	.L182
	ldr	ip, [r0, #68]
	cmp	ip, #0
	bne	.L182
	ldr	ip, .L186+16
	ldr	ip, [ip]
	cmp	ip, #3
	cmpne	ip, #0
	ldr	r7, .L186+8
	bne	.L100
	b	.L97
.L101:
	mov	r3, #1
	add	r2, r2, #500
	str	r2, [r0, #52]
	str	r3, [r0, #64]
	ldr	r6, [r0, #4]
	add	r1, r1, r2
	b	.L120
.L106:
	ldr	r1, [r0, #12]
	cmp	r1, #84
	ble	.L108
	add	r5, r5, r3
	cmp	r5, #352
	str	r5, [ip]
	bge	.L107
.L108:
	cmp	r1, #64
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #0
	moveq	r3, r1
	movne	r3, #0
	cmp	r3, #0
	addne	r5, r5, #1
	strne	r5, [ip]
	beq	.L109
	b	.L110
.L185:
	ldr	r3, [r0, #8]
	add	r1, r2, #500
	str	r1, [r0, #52]
	add	r1, r1, r3
	b	.L120
.L103:
	cmp	r5, #0
	ble	.L106
	sub	r5, r5, #1
	str	r5, [ip]
	b	.L105
.L183:
	ldr	r7, .L186+8
.L96:
	ldr	ip, .L186+4
	ldrh	ip, [ip, #48]
	tst	ip, #16
	bne	.L100
	b	.L97
.L187:
	.align	2
.L186:
	.word	player
	.word	67109120
	.word	hOff
	.word	vOff
	.word	gameState
	.word	collisionMapBitmap
	.word	oldButtons
	.word	buttons
	.word	-6144
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateStatue
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStatue, %function
updateStatue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L223
	ldr	r3, [r4, #28]
	ldr	r5, .L223+4
	cmp	r3, #100
	ldr	r2, [r5]
	sub	sp, sp, #20
	bgt	.L189
	ldr	r1, [r4, #4]
	cmn	r3, r1
	bmi	.L189
	ldr	r1, .L223+8
	ldr	r1, [r1]
	cmp	r1, #0
	beq	.L218
.L189:
	cmp	r2, #3
	beq	.L219
.L190:
	ldr	r2, .L223+12
	ldr	r3, .L223+16
	ldr	r0, [r2]
	ldr	r1, [r3]
	ldr	r2, [r4, #24]
	ldr	r3, [r4, #16]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #28]
	str	r3, [r4, #20]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L219:
	ldr	r2, [r4, #56]
	cmp	r2, #1
	ldr	ip, [r4]
	ldr	r1, [r4, #4]
	beq	.L220
	cmp	r2, #0
	beq	.L221
.L196:
	ldr	r6, .L223+20
	add	r0, r6, #16
	ldm	r0, {r0, r2}
	add	r3, r3, r1
	str	r3, [sp, #4]
	str	r1, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r4, #20]
	add	r2, r2, r2, lsr #31
	ldr	r3, [r6, #24]
	ldr	r1, [r6, #12]
	ldr	r7, .L223+24
	str	lr, [sp]
	asr	r2, r2, #1
	add	r0, r0, #8
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	streq	r0, [r4, #48]
	beq	.L200
	ldr	r2, [r4, #48]
	ldr	r3, [r6, #68]
	orrs	r3, r2, r3
	bne	.L200
	ldr	r2, [r6, #12]
	ldr	r1, [r4, #28]
	sub	r2, r2, #2
	cmp	r2, r1
	ble	.L222
	ldr	lr, .L223+28
	ldr	r2, [lr]
	rsb	r1, r2, #3
	cmp	r1, #0
	cmpge	r2, #0
	ldrgt	r0, .L223+32
	addgt	r1, r1, r1, lsl #1
	addgt	r1, r0, r1, lsl #3
	strgt	r3, [r1, #20]
	sub	ip, r2, #1
	mov	r3, #0
	ldr	r2, .L223+36
	ldr	r1, .L223+40
	ldr	r0, .L223+44
	ldr	r6, .L223+48
	str	ip, [lr]
	mov	lr, pc
	bx	r6
.L202:
	mov	r3, #1
	str	r3, [r4, #48]
.L200:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	moveq	r2, #6
	streq	r3, [r4, #12]
	streq	r2, [r5]
	b	.L190
.L218:
	sub	r1, r2, #5
	cmp	r2, #3
	cmpne	r1, #1
	bls	.L189
	mov	r3, #3
	mov	r2, #2
	str	r3, [r4, #40]
	str	r3, [r4, #52]
	str	r2, [r5]
	b	.L190
.L221:
	ldr	r0, [r4, #16]
.L195:
	cmp	r0, #0
	blt	.L197
	ldr	r6, [r4, #24]
	ldr	lr, [r4, #32]
	add	r2, r1, r1, lsr #31
	add	r2, r6, r2, asr #1
	sub	lr, r0, lr
	ldr	r7, .L223+52
	add	r2, lr, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	beq	.L197
	add	r6, r6, r1
	sub	r6, r6, #1
	add	lr, lr, r6, lsl #8
	lsl	lr, lr, #1
	ldrh	r2, [r7, lr]
	cmp	r2, #0
	bne	.L198
.L197:
	mov	r2, #1
	str	r2, [r4, #56]
	b	.L196
.L220:
	ldr	r0, [r4, #16]
	add	r2, r0, ip
	cmp	r2, #256
	bgt	.L193
	ldr	r7, [r4, #32]
	ldr	r6, [r4, #24]
	sub	lr, r2, #1
	add	r2, r1, r1, lsr #31
	add	lr, lr, r7
	add	r2, r6, r2, asr #1
	ldr	r7, .L223+52
	add	r2, lr, r2, lsl #8
	lsl	r2, r2, #1
	ldrh	r2, [r7, r2]
	cmp	r2, #0
	beq	.L193
	add	r6, r6, r1
	sub	r6, r6, #1
	add	lr, lr, r6, lsl #8
	lsl	lr, lr, #1
	ldrh	r2, [r7, lr]
	cmp	r2, #0
	ldrne	r2, [r4, #36]
	addne	r0, r2, r0
	strne	r0, [r4, #16]
	bne	.L196
.L193:
	mov	r2, #0
	str	r2, [r4, #56]
	b	.L195
.L198:
	ldr	r2, [r4, #36]
	sub	r0, r0, r2
	str	r0, [r4, #16]
	b	.L196
.L222:
	add	ip, r4, #36
	ldm	ip, {ip, lr}
	ldr	r2, .L223+36
	sub	lr, lr, #1
	add	ip, ip, #1
	ldr	r1, .L223+56
	ldr	r0, .L223+60
	ldr	r6, .L223+48
	str	lr, [r4, #40]
	str	ip, [r4, #36]
	mov	lr, pc
	bx	r6
	b	.L202
.L224:
	.align	2
.L223:
	.word	statue
	.word	gameState
	.word	gemsRemaining
	.word	vOff
	.word	hOff
	.word	player
	.word	collision
	.word	livesRemaining
	.word	hearts
	.word	11025
	.word	1402
	.word	HurtSound
	.word	playSoundB
	.word	collisionMapBitmap
	.word	21004
	.word	EnemyInjured
	.size	updateStatue, .-updateStatue
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
.L226:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L227
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L228:
	.align	2
.L227:
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
.L230:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L231
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L232:
	.align	2
.L231:
	.word	shadowOAM
	.size	updateWolves, .-updateWolves
	.align	2
	.global	updateHearts
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHearts, %function
updateHearts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #20]
	cmp	r3, #0
	ldr	r3, [r0, #16]
	beq	.L234
	ldr	r2, [r0, #4]
	ldr	r1, .L240
	str	lr, [sp, #-4]!
	lsl	r2, r2, #23
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldr	r0, .L240+4
	lsl	ip, r3, #3
	lsr	r2, r2, #23
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, ip]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L234:
	mov	r1, #512
	ldr	r2, .L240
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L241:
	.align	2
.L240:
	.word	shadowOAM
	.word	4144
	.size	updateHearts, .-updateHearts
	.align	2
	.global	updateText
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateText, %function
updateText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r5, .L264
	ldr	r3, [r5]
	sub	r2, r3, #1
	cmp	r2, #1
	bls	.L260
	ldr	r4, .L264+4
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L261
.L247:
	mov	r1, #512
	ldr	r3, [r4, #8]
	ldr	r2, .L264+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L260:
	ldr	r2, .L264+12
	ldrh	r2, [r2]
	ldr	r4, .L264+4
	tst	r2, #1
	ldr	r2, [r4, #24]
	beq	.L244
	ldr	r1, .L264+16
	ldrh	r1, [r1]
	tst	r1, #1
	addeq	r2, r2, #1
	streq	r2, [r4, #24]
.L244:
	cmp	r2, #2
	beq	.L262
	cmp	r2, #4
	cmpeq	r3, #2
	beq	.L263
.L246:
	mov	r3, #1
	str	r3, [r4, #12]
.L248:
	ldr	r3, [r4, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r1, [r4, #8]
	ldrb	r0, [r4, #20]	@ zero_extendqisi2
	ldr	ip, .L264+8
	lsl	r2, r2, #7
	lsl	lr, r1, #3
	add	r2, r2, #21
	add	r1, ip, r1, lsl #3
	orr	r0, r0, #16384
	strh	r0, [ip, lr]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L261:
	ldr	r2, [r4, #24]
	b	.L248
.L262:
	cmp	r3, #1
	moveq	r3, #0
	streq	r3, [r4, #12]
	streq	r3, [r5]
	bne	.L246
	b	.L247
.L263:
	ldr	r3, .L264+20
	mov	lr, pc
	bx	r3
	ldr	r6, .L264+24
	mov	r3, #1
	ldr	r2, .L264+28
	ldr	r1, .L264+32
	ldr	r0, .L264+36
	mov	lr, pc
	bx	r6
	mov	r2, #0
	mov	r3, #3
	str	r2, [r4, #12]
	str	r3, [r5]
	b	.L247
.L265:
	.align	2
.L264:
	.word	gameState
	.word	textBubble
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	725763
	.word	BossBattleSongLooping
	.size	updateText, .-updateText
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
	bl	updateStatue
	ldr	r4, .L280
	ldr	r5, .L280+4
	add	r6, r4, #128
.L269:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L267
	mov	r0, r4
	bl	updateGems.part.0
.L268:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L269
	ldr	r4, .L280+8
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L270
	mov	r2, #512
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L271:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L272
	mov	r2, #512
	ldr	r3, [r4, #96]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L274:
	mov	r7, #512
	ldr	r3, .L280+12
	ldr	r6, .L280+16
	ldr	r4, .L280+20
	add	ip, r3, #72
.L273:
	ldr	r2, [r3, #20]
	cmp	r2, #0
	ldr	r2, [r3, #16]
	add	r1, r5, r2, lsl #3
	lsl	r0, r2, #3
	ldrne	r2, [r3, #4]
	ldrbne	lr, [r3]	@ zero_extendqisi2
	andne	r2, r2, r6
	lsleq	r2, r2, #3
	add	r3, r3, #24
	strhne	lr, [r5, r0]	@ movhi
	strheq	r7, [r5, r2]	@ movhi
	strhne	r2, [r1, #2]	@ movhi
	strhne	r4, [r1, #4]	@ movhi
	cmp	r3, ip
	bne	.L273
	pop	{r4, r5, r6, r7, r8, lr}
	b	updateText
.L267:
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L268
.L272:
	ldr	r0, .L280+24
	bl	updateWolves.part.0
	b	.L274
.L270:
	mov	r0, r4
	bl	updateWolves.part.0
	b	.L271
.L281:
	.align	2
.L280:
	.word	gems
	.word	shadowOAM
	.word	wolves
	.word	hearts
	.word	511
	.word	4144
	.word	wolves+68
	.size	updateGame, .-updateGame
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
	ldr	r1, .L283
	ldr	r3, [r1, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #40]
	ldr	r2, [r1, #32]
	add	r2, r2, r0, lsl #5
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	ldr	r0, .L283+4
	lsl	r2, r2, #2
	orr	r2, r2, #8192
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L284:
	.align	2
.L283:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	drawGemCounterIcon
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGemCounterIcon, %function
drawGemCounterIcon:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #16
	ldr	r1, .L287
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L287+4
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
.L288:
	.align	2
.L287:
	.word	gemCounterIcon
	.word	shadowOAM
	.size	drawGemCounterIcon, .-drawGemCounterIcon
	.align	2
	.global	drawGemNum
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGemNum, %function
drawGemNum:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L291
	ldr	r3, .L291+4
	ldr	r1, [r0, #4]
	ldr	r2, [r3]
	ldr	ip, .L291+8
	ldr	r3, [r0, #16]
	str	lr, [sp, #-4]!
	lsl	r1, r1, #23
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #5
	lsl	r0, r3, #3
	lsr	r1, r1, #23
	add	r3, ip, r3, lsl #3
	add	r2, r2, #80
	strh	lr, [ip, r0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L292:
	.align	2
.L291:
	.word	gemNum
	.word	gemsRemaining
	.word	shadowOAM
	.size	drawGemNum, .-drawGemNum
	.align	2
	.global	drawStatue
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawStatue, %function
drawStatue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L300
	ldr	r1, [r2, #28]
	cmp	r1, #160
	ldr	r3, [r2, #8]
	bgt	.L294
	ldr	r0, [r2, #4]
	cmn	r1, r0
	bmi	.L294
	ldr	r0, [r2, #12]
	cmp	r0, #0
	bne	.L295
.L294:
	mov	r1, #512
	ldr	r2, .L300+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L295:
	ldr	r0, [r2, #20]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	mvn	r0, r0, lsl #17
	mvn	r0, r0, lsr #17
	push	{r4, lr}
	ldr	ip, [r2, #40]
	ldr	r4, [r2, #52]
	ldr	lr, .L300+4
	lsl	ip, ip, #7
	add	r2, ip, #17
	orr	r2, r2, r4, lsl #12
	lsl	ip, r3, #3
	and	r1, r1, #255
	add	r3, lr, r3, lsl #3
	strh	r1, [lr, ip]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L301:
	.align	2
.L300:
	.word	statue
	.word	shadowOAM
	.size	drawStatue, .-drawStatue
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
	ldr	r1, .L304
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #16]
	ldr	r5, .L304+4
	and	r2, r2, r5
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	mov	ip, #16
	ldr	lr, [r1, #40]
	ldr	r3, [r1, #32]
	ldr	r4, .L304+8
	ldr	r6, .L304+12
	ldr	r0, .L304+16
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	add	r3, r3, lr, lsl #5
	ldr	r0, [r0]
	lsl	r3, r3, #2
	strh	r2, [r4, #2]	@ movhi
	ldr	r2, [r6, #28]
	ldr	lr, .L304+20
	strh	r1, [r4]	@ movhi
	orr	r3, r3, #8192
	ldrb	r1, [r6]	@ zero_extendqisi2
	ldr	r6, [r6, #4]
	strh	r3, [r4, #4]	@ movhi
	lsl	r3, r2, #3
	strh	r1, [r4, r3]	@ movhi
	ldr	r3, [lr, #16]
	ldr	r1, [lr, #4]
	add	r2, r4, r2, lsl #3
	ldrb	lr, [lr]	@ zero_extendqisi2
	and	r6, r6, r5
	lsl	r0, r0, #5
	strh	ip, [r2, #4]	@ movhi
	strh	r6, [r2, #2]	@ movhi
	and	r1, r1, r5
	lsl	r2, r3, #3
	add	r0, r0, #80
	add	r3, r4, r3, lsl #3
	strh	lr, [r4, r2]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	bl	drawStatue
	ldr	r3, .L304+24
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L304+28
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L304+32
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #20]	@ movhi
	ldr	r2, .L304+36
	ldr	r2, [r2]
	asr	r3, r3, #2
	asr	r1, r2, #2
	lsl	r3, r3, #16
	lsl	r2, r2, #16
	lsl	r1, r1, #16
	lsr	r3, r3, #16
	lsr	r2, r2, #16
	lsr	r1, r1, #16
	strh	r2, [r0, #22]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r3, [r0, #24]	@ movhi
	strh	r1, [r0, #26]	@ movhi
	bx	lr
.L305:
	.align	2
.L304:
	.word	player
	.word	511
	.word	shadowOAM
	.word	gemCounterIcon
	.word	gemsRemaining
	.word	gemNum
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	textBubble,28,4
	.comm	statue,60,4
	.comm	hearts,72,4
	.comm	gemNum,20,4
	.comm	wolves,136,4
	.comm	blocks,160,4
	.comm	gemCounterIcon,32,4
	.comm	gems,128,4
	.comm	player,72,4
	.comm	gameState,4,4
	.comm	statueLivesRemaining,4,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
