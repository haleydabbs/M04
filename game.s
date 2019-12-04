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
	ldr	r6, .L55+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+40
	str	r5, [r3, #92]
	ldr	r5, [r6]
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
	mov	r10, #5
	mov	r8, #2
	str	r5, [fp, #8]
	mov	r5, #176
	str	r4, [r3, #124]
	str	r8, [r3, #60]
	str	r1, [fp, #64]
	str	r1, [r3, #28]
	str	r1, [r3, #24]
	str	r1, [r3, #56]
	str	r1, [r3, #88]
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
	str	r0, [fp, #28]
	str	r0, [fp, #40]
	str	r0, [fp, #32]
	str	r0, [fp, #56]
	str	r0, [fp, #52]
	str	r10, [fp, #48]
	str	r8, [fp, #60]
	str	r5, [r3, #32]
	mov	r5, #128
	str	r5, [r3, #68]
	mov	r5, #56
	mov	r9, #16
	str	r5, [r3, #64]
	mov	r5, #256
	str	r1, [r3, #120]
	str	r5, [r3, #96]
	str	r9, [r3, #100]
	ldr	r3, .L55+48
	str	r4, [r3, #44]
	str	r4, [r3, #112]
	mov	r4, #6
	str	r4, [r3, #96]
	mov	r4, #96
	str	r4, [r3, #72]
	mov	r4, #152
	str	r4, [r3, #68]
	mov	r4, #7
	mov	lr, #144
	str	r10, [r3, #28]
	str	r9, [r3, #4]
	str	r1, [r3, #24]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #52]
	str	r1, [r3, #56]
	str	ip, [r3]
	str	r1, [r3, #92]
	str	r1, [r3, #120]
	str	r1, [r3, #124]
	str	r0, [r3, #60]
	str	ip, [r3, #84]
	str	ip, [r3, #88]
	str	r0, [r3, #128]
	ldr	r3, .L55+52
	str	r4, [r3, #28]
	mov	r4, #18
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	str	r2, [r3, #4]
	str	lr, [r3]
	ldr	r3, .L55+56
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #4]
	str	lr, [r3]
	str	r2, [r3, #16]
	ldr	r3, .L55+60
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
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
	ldr	r2, .L55+64
	mov	r4, #192
	str	r1, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #68]
	str	r1, [r2, #12]
	mov	r1, #12
	mov	r5, #11
	str	r4, [r3, #52]
	add	r4, r4, #250
	str	lr, [r2, #16]
	str	ip, [r2]
	str	ip, [r2, #4]
	str	r0, [r2, #40]
	str	r0, [r2, #44]
	str	r4, [r2, #24]
	str	r1, [r2, #8]
	mov	r2, #352
	str	lr, [r3]
	str	lr, [r3, #24]
	str	lr, [r3, #48]
	str	r5, [r3, #64]
	ldr	r3, .L55+68
	str	r0, [r6]
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
	.word	hearts
	.word	statue
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
	ldr	r4, .L88
	ldr	r3, .L88+4
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
	ldr	r3, .L88+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L71:
	ldr	r3, .L88+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #1
	streq	r3, [r4, #32]
	ldr	r3, .L88+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	streq	r3, [r4, #32]
	ldr	r3, .L88+12
	ldrh	r3, [r3, #48]
	tst	r3, #128
	ldr	r3, [r4, #64]
	bne	.L74
	mov	r2, #1
	cmp	r3, #0
	str	r2, [r4, #68]
	beq	.L81
.L75:
	ldr	r3, .L88+12
	ldrh	r0, [r3, #48]
	ldr	r3, [r4, #36]
	tst	r0, #32
	str	r3, [r4, #32]
	moveq	r3, #1
	mov	r1, #2
	mov	r2, #0
	streq	r3, [r4, #32]
	ldr	r3, .L88+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	str	r1, [r4, #40]
	str	r2, [r4, #28]
	streq	r3, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	mov	r2, #0
	cmp	r3, r2
	str	r2, [r4, #68]
	bne	.L75
	ldr	r2, [r4, #32]
	cmp	r2, #2
	beq	.L87
	cmp	r2, #3
	beq	.L81
	add	r5, r5, #1
	str	r5, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	mov	r2, #5
	mov	r3, #0
	str	r6, [r4, #32]
	str	r2, [r4, #40]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L87:
	str	r3, [r4, #40]
	str	r3, [r4, #28]
	str	r6, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
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
	ldr	r0, .L176
	ldr	r1, [r0, #8]
	ldr	r2, [r0, #52]
	cmp	r1, #0
	add	ip, r1, #1020
	add	ip, ip, #3
	add	r3, r2, #1020
	movge	ip, r1
	cmp	r2, #0
	add	r3, r3, #3
	movge	r3, r2
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L176+4
	ldrh	r4, [lr, #48]
	asr	ip, ip, #10
	asr	r3, r3, #10
	tst	r4, #32
	str	ip, [r0]
	str	r3, [r0, #56]
	bne	.L91
	ldr	r4, [r0, #68]
	cmp	r4, #0
	beq	.L172
	ldrh	lr, [lr, #48]
.L169:
	ldr	r7, .L176+8
.L96:
	ldr	lr, .L176+12
	cmn	r2, #1024
	ldr	r5, [lr]
	ble	.L98
	mov	r1, #1
	cmp	r5, #0
	str	r1, [r0, #64]
	ble	.L99
	ldr	r1, [r0, #12]
	cmp	r1, #43
	bgt	.L99
	sub	r5, r5, r3
	cmp	r3, #0
	str	r5, [lr]
	beq	.L100
	cmp	r5, #352
	bge	.L104
.L106:
	ldr	r5, [lr]
.L107:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [lr]
	b	.L109
.L172:
	ldr	lr, [r0, #4]
	cmn	lr, #7
	blt	.L170
	ldr	r6, [r0, #60]
	add	r4, lr, #8
	sub	r4, r4, r6
	ldr	r7, .L176+16
	add	r5, r4, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L170
	ldr	r5, [r0, #24]
	add	r5, ip, r5
	sub	r5, r5, #1
	add	r4, r4, r5, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	ldr	r7, .L176+8
	beq	.L94
	ldr	r4, [r7]
	sub	lr, lr, r6
	cmp	r4, #0
	str	lr, [r0, #4]
	ble	.L94
	ldr	lr, [r0, #16]
	cmp	lr, #119
	suble	r4, r4, r6
	strle	r4, [r7]
	b	.L94
.L99:
	cmp	r3, #0
	bne	.L102
	ldr	r1, [r0, #12]
	cmp	r1, #63
	ble	.L100
.L102:
	cmp	r5, #352
	blt	.L103
.L104:
	cmp	r5, #352
	movne	r5, #352
	strne	r5, [lr]
.L109:
	ldr	r1, [r0, #24]
	ldr	r6, [r0, #4]
	ldr	r3, .L176+16
	add	r1, ip, r1
	add	r4, r6, r1, lsl #8
	add	lr, r3, r4, lsl #1
	ldrh	lr, [lr, #16]
	cmp	lr, #0
	ldr	lr, [r0, #20]
	beq	.L110
	add	r4, r4, lr
	add	r4, r3, r4, lsl #1
	ldrh	r4, [r4, #-18]
	cmp	r4, #0
	bne	.L173
.L110:
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
	b	.L112
.L113:
	mov	r8, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L112:
	add	r1, lr, r3
	ldrh	r1, [r1, r4]
	cmp	r1, #0
	beq	.L113
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L113
	ldr	r3, .L176+20
	ldrh	r3, [r3]
	cmp	r8, #0
	movne	ip, r2
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L115
	ldr	r3, .L176+24
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L174
.L115:
	mov	r3, #0
	str	r3, [r0, #52]
	str	r3, [r0, #64]
.L117:
	ldr	r3, [r7]
	sub	r6, r6, r3
	sub	ip, ip, r5
	str	r6, [r0, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	str	ip, [r0, #12]
	str	r1, [r0, #8]
	b	animatePlayer
.L91:
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L169
	ldr	lr, [r0, #68]
	cmp	lr, #0
	ldr	r7, .L176+8
	bne	.L96
	ldr	r5, [r0, #4]
	cmp	r5, #231
	bgt	.L96
.L175:
	ldr	lr, [r0, #20]
	ldr	r6, [r0, #60]
	add	lr, r5, lr
	sub	lr, lr, #9
	add	r4, lr, r6
	add	r8, r4, ip, lsl #8
	ldr	lr, .L176+16
	lsl	r8, r8, #1
	ldrh	r8, [lr, r8]
	cmp	r8, #0
	beq	.L96
	ldr	r8, [r0, #24]
	add	r8, ip, r8
	sub	r8, r8, #1
	add	r4, r4, r8, lsl #8
	lsl	r4, r4, #1
	ldrh	lr, [lr, r4]
	cmp	lr, #0
	beq	.L96
	ldr	r4, [r7]
	add	lr, r5, r6
	cmp	r4, #15
	str	lr, [r0, #4]
	bgt	.L96
	ldr	lr, [r0, #16]
	cmp	lr, #120
	addgt	r6, r6, r4
	strgt	r6, [r7]
	b	.L96
.L98:
	mov	r3, #1
	add	r2, r2, #500
	str	r2, [r0, #52]
	str	r3, [r0, #64]
	ldr	r6, [r0, #4]
	add	r1, r1, r2
	b	.L117
.L103:
	ldr	r1, [r0, #12]
	cmp	r1, #84
	ble	.L105
	add	r5, r5, r3
	cmp	r5, #352
	str	r5, [lr]
	bge	.L104
.L105:
	cmp	r1, #64
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #0
	moveq	r3, r1
	movne	r3, #0
	cmp	r3, #0
	addne	r5, r5, #1
	strne	r5, [lr]
	beq	.L106
	b	.L107
.L173:
	ldr	r3, [r0, #8]
	add	r1, r2, #500
	str	r1, [r0, #52]
	add	r1, r1, r3
	b	.L117
.L170:
	ldr	r7, .L176+8
.L94:
	ldr	lr, .L176+4
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L96
	ldr	r5, [r0, #4]
	cmp	r5, #231
	bgt	.L96
	b	.L175
.L174:
	cmp	r2, #0
	ldrgt	r3, .L176+28
	ldrle	r3, [r0, #52]
	strgt	r3, [r0, #52]
	addle	r1, r1, r3
	addgt	r1, r1, r3
	b	.L117
.L100:
	cmp	r5, #0
	ble	.L103
	sub	r5, r5, #1
	str	r5, [lr]
	b	.L102
.L177:
	.align	2
.L176:
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
	.global	updateStatue
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStatue, %function
updateStatue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L187
	ldr	r3, [r4, #28]
	cmp	r3, #160
	sub	sp, sp, #20
	bgt	.L180
	ldr	r1, [r4, #4]
	cmn	r3, r1
	bmi	.L180
	ldr	r2, .L187+4
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L186
.L180:
	ldr	r2, .L187+8
	ldr	r3, .L187+12
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
	pop	{r4, r5, lr}
	bx	lr
.L186:
	ldr	ip, .L187+16
	add	r0, ip, #16
	ldm	r0, {r0, r2}
	ldr	r5, [r4]
	ldr	lr, [r4, #20]
	add	r2, r2, r2, lsr #31
	asr	r2, r2, #1
	str	r1, [sp, #12]
	str	r3, [sp, #4]
	str	r5, [sp, #8]
	ldr	r3, [ip, #24]
	ldr	r1, [ip, #12]
	str	lr, [sp]
	ldr	r5, .L187+20
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #20
	movne	r3, #1
	strne	r2, [r4, #40]
	strne	r3, [r4, #44]
	b	.L180
.L188:
	.align	2
.L187:
	.word	statue
	.word	gemsRemaining
	.word	vOff
	.word	hOff
	.word	player
	.word	collision
	.size	updateStatue, .-updateStatue
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
	ldr	r4, .L203
	ldr	r5, .L203+4
	add	r6, r4, #128
.L192:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L190
	mov	r0, r4
	bl	updateGems.part.0
.L191:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L192
	ldr	r4, .L203+8
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L193
	mov	r2, #512
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L194:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	bne	.L195
	mov	r2, #512
	ldr	r3, [r4, #96]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L197:
	mov	r7, #512
	ldr	r3, .L203+12
	ldr	r6, .L203+16
	ldr	r4, .L203+20
	add	ip, r3, #72
.L196:
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
	bne	.L196
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L190:
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L191
.L195:
	ldr	r0, .L203+24
	bl	updateWolves.part.0
	b	.L197
.L193:
	mov	r0, r4
	bl	updateWolves.part.0
	b	.L194
.L204:
	.align	2
.L203:
	.word	gems
	.word	shadowOAM
	.word	wolves
	.word	hearts
	.word	511
	.word	4144
	.word	wolves+68
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
.L206:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L207
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L208:
	.align	2
.L207:
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
.L210:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L211
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L212:
	.align	2
.L211:
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
	beq	.L214
	ldr	r2, [r0, #4]
	ldr	r1, .L220
	str	lr, [sp, #-4]!
	lsl	r2, r2, #23
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldr	r0, .L220+4
	lsl	ip, r3, #3
	lsr	r2, r2, #23
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, ip]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L214:
	mov	r1, #512
	ldr	r2, .L220
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L221:
	.align	2
.L220:
	.word	shadowOAM
	.word	4144
	.size	updateHearts, .-updateHearts
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
	ldr	r1, .L223
	ldr	r3, [r1, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r0, [r1, #40]
	ldr	r2, [r1, #32]
	add	r2, r2, r0, lsl #5
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	ldr	r0, .L223+4
	lsl	r2, r2, #2
	orr	r2, r2, #8192
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L224:
	.align	2
.L223:
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
	ldr	r1, .L227
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L227+4
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
.L228:
	.align	2
.L227:
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
	ldr	r0, .L231
	ldr	r3, .L231+4
	ldr	r1, [r0, #4]
	ldr	r2, [r3]
	ldr	ip, .L231+8
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
.L232:
	.align	2
.L231:
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
	ldr	r2, .L240
	ldr	r1, [r2, #28]
	cmp	r1, #160
	ldr	r3, [r2, #8]
	bgt	.L234
	ldr	r0, [r2, #4]
	cmn	r1, r0
	bmi	.L234
	ldr	r0, [r2, #20]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	mvn	r0, r0, lsl #17
	mvn	r0, r0, lsr #17
	ldr	r2, [r2, #40]
	ldr	ip, .L240+4
	lsl	r2, r2, #5
	str	lr, [sp, #-4]!
	and	r1, r1, #255
	lsl	lr, r3, #3
	add	r2, r2, #17
	add	r3, ip, r3, lsl #3
	strh	r1, [ip, lr]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L234:
	mov	r1, #512
	ldr	r2, .L240+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L241:
	.align	2
.L240:
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
	ldr	r1, .L244
	push	{r4, r5, r6, lr}
	ldr	r2, [r1, #16]
	ldr	r5, .L244+4
	and	r2, r2, r5
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	mov	ip, #16
	ldr	lr, [r1, #40]
	ldr	r3, [r1, #32]
	ldr	r4, .L244+8
	ldr	r6, .L244+12
	ldr	r0, .L244+16
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	add	r3, r3, lr, lsl #5
	ldr	r0, [r0]
	lsl	r3, r3, #2
	strh	r2, [r4, #2]	@ movhi
	ldr	r2, [r6, #28]
	ldr	lr, .L244+20
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
	ldr	r3, .L244+24
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L244+28
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L244+32
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #20]	@ movhi
	ldr	r2, .L244+36
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
.L245:
	.align	2
.L244:
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
	.comm	statue,52,4
	.comm	hearts,72,4
	.comm	gemNum,20,4
	.comm	wolves,136,4
	.comm	blocks,160,4
	.comm	gemCounterIcon,32,4
	.comm	gems,128,4
	.comm	player,72,4
	.comm	statueLivesRemaining,4,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
