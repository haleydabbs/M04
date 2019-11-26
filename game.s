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
	mov	r0, #16
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
	ldr	r1, .L49
	ldr	r3, .L49+4
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
	beq	.L45
.L14:
	cmp	r3, #160
	bgt	.L22
	ldr	r1, [r4, #20]
	cmn	r3, r1
	bpl	.L23
.L22:
	mov	r1, #512
	ldr	r3, [r4, #28]
	ldr	r2, .L49+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L23:
	ldr	lr, .L49+12
	add	r0, r1, r1, lsr #31
	ldr	r2, [lr, #20]
	add	r3, r3, r0, asr #1
	ldr	r0, [lr, #16]
	str	r1, [sp, #12]
	ldr	r5, [r4, #16]
	str	r3, [sp, #4]
	str	ip, [sp]
	add	r2, r2, r2, lsr #31
	ldr	r3, [lr, #24]
	ldr	r1, [lr, #12]
	asr	r2, r2, #1
	str	r5, [sp, #8]
	add	r0, r0, #8
	ldr	r5, .L49+16
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	streq	r0, [r4, #52]
	beq	.L28
	ldr	r2, [r4, #52]
	cmp	r2, #0
	bne	.L26
	ldr	r0, .L49+20
	ldr	r3, [r0]
	rsb	r1, r3, #3
	cmp	r1, #0
	cmpge	r3, #0
	ldrgt	ip, .L49+24
	addgt	r1, r1, r1, lsl #1
	addgt	r1, ip, r1, lsl #3
	sub	r3, r3, #1
	strgt	r2, [r1, #20]
	str	r3, [r0]
.L26:
	mov	r3, #1
	str	r3, [r4, #52]
.L28:
	ldr	r3, [r4, #12]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	r2, [r4, #40]
	ldr	r1, [r4, #28]
	ldr	r0, .L49+8
	lsl	r2, r2, #5
	ldrb	lr, [r4, #8]	@ zero_extendqisi2
	add	r2, r2, #12
	lsl	ip, r1, #3
	orr	r2, r2, #4096
	add	r1, r0, r1, lsl #3
	strh	lr, [r0, ip]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L45:
	ldr	r2, [r4, #48]
	cmp	r2, #1
	beq	.L46
	cmp	r2, #0
	beq	.L18
.L19:
	mov	r2, #0
	str	r2, [r4, #32]
	b	.L14
.L46:
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
	ldr	r5, .L49+28
	add	lr, r2, lr, lsl #8
	lsl	lr, lr, #1
	ldrh	lr, [r5, lr]
	cmp	lr, #0
	bne	.L47
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
	ldr	r5, .L49+28
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
	bne	.L48
.L20:
	mov	r2, #1
	str	r2, [r4, #48]
	mov	r2, #0
	str	r2, [r4, #32]
	b	.L14
.L47:
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
.L48:
	add	r1, r1, #256
	lsl	r1, r1, #1
	ldrh	r2, [r5, r1]
	cmp	r2, #0
	subeq	r2, r0, #1
	streq	r2, [r4, #4]
	beq	.L19
	b	.L20
.L50:
	.align	2
.L49:
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.word	player
	.word	collision
	.word	livesRemaining
	.word	hearts
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
	ldr	r6, .L53
	mov	r3, #16384
	ldr	r2, .L53+4
	ldr	r1, .L53+8
	mov	lr, pc
	bx	r6
	mov	r0, r5
	mov	r3, #256
	ldr	r2, .L53+12
	ldr	r1, .L53+16
	mov	lr, pc
	bx	r6
	ldr	r0, .L53+20
	ldr	r1, .L53+24
	ldr	r2, .L53+28
	ldr	r3, .L53+32
	str	r4, [r0]
	str	r4, [r1]
	str	r5, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+36
	str	r4, [r3, #124]
	ldr	r4, .L53+40
	str	r5, [r3, #92]
	ldr	r5, [r4]
	str	fp, [r3, #36]
	ldr	fp, .L53+44
	add	r5, r5, r7
	str	r5, [fp, #4]
	mov	r5, #475136
	mov	r2, #8
	mov	r1, #1
	mov	r0, #0
	mov	ip, #32
	mov	r6, #5
	mov	r8, #2
	str	r5, [fp, #8]
	mov	r10, #464
	mov	r5, #176
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
	str	r10, [fp]
	str	ip, [fp, #20]
	str	ip, [fp, #24]
	str	r0, [fp, #28]
	str	r0, [fp, #40]
	str	r0, [fp, #32]
	str	r0, [fp, #56]
	str	r0, [fp, #52]
	str	r6, [fp, #48]
	str	r8, [fp, #60]
	str	r5, [r3, #32]
	mov	r5, #128
	str	r5, [r3, #68]
	mov	r5, #56
	str	r5, [r3, #64]
	mov	r5, #256
	mov	r9, #16
	str	r5, [r3, #96]
	mov	r5, #6
	str	r9, [r3, #100]
	str	r1, [r3, #120]
	ldr	r3, .L53+48
	str	r5, [r3, #84]
	mov	r5, #96
	str	r5, [r3, #60]
	mov	r5, #152
	str	r5, [r3, #56]
	mov	r5, #7
	mov	lr, #144
	str	r9, [r3, #4]
	str	r6, [r3, #28]
	str	ip, [r3]
	str	r1, [r3, #24]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #48]
	str	r1, [r3, #80]
	str	r1, [r3, #100]
	str	r1, [r3, #104]
	str	r0, [r3, #52]
	str	ip, [r3, #72]
	str	ip, [r3, #76]
	str	r0, [r3, #108]
	ldr	r3, .L53+52
	str	r5, [r3, #28]
	mov	r5, #18
	str	r2, [r3, #4]
	str	lr, [r3]
	str	r2, [r3, #16]
	str	r2, [r3, #20]
	ldr	r3, .L53+56
	str	r2, [r3, #8]
	str	r2, [r3, #12]
	str	lr, [r3]
	str	r5, [r3, #4]
	str	r2, [r3, #16]
	ldr	r3, .L53+60
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
	mov	r2, #192
	str	r0, [r4]
	str	r2, [r3, #52]
	mov	r4, #11
	ldr	r2, .L53+64
	str	r1, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #68]
	str	r1, [r2, #12]
	mov	r1, #12
	str	r4, [r3, #64]
	ldr	r4, .L53+68
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
	ldr	r3, .L53+72
	str	r2, [r3]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	100728832
	.word	FinalGameSpritesTiles
	.word	83886592
	.word	FinalGameSpritesPal
	.word	gemsRemaining
	.word	statueLivesRemaining
	.word	livesRemaining
	.word	hideSprites
	.word	gems
	.word	hOff
	.word	player
	.word	wolves
	.word	gemCounterIcon
	.word	gemNum
	.word	hearts
	.word	statue
	.word	442
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
	bne	.L56
	mov	r3, #104
	str	r3, [r0, #4]
	str	r3, [r0]
.L57:
	mov	r3, #1
	str	r3, [r0, #24]
	bx	lr
.L56:
	cmp	r1, #1
	beq	.L60
	cmp	r1, #2
	beq	.L61
	cmp	r1, #3
	moveq	r2, #256
	moveq	r3, #16
	stmeq	r0, {r2, r3}
	b	.L57
.L60:
	mov	r2, #176
	mov	r3, #240
	stm	r0, {r2, r3}
	b	.L57
.L61:
	mov	r2, #56
	mov	r3, #128
	stm	r0, {r2, r3}
	b	.L57
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
	mov	ip, #0
	mov	r3, #1
	mov	r2, #32
	str	lr, [sp, #-4]!
	cmp	r1, ip
	add	lr, r1, #5
	str	lr, [r0, #28]
	str	ip, [r0, #52]
	str	r3, [r0, #24]
	str	r3, [r0, #44]
	str	r3, [r0, #48]
	str	r2, [r0, #16]
	str	r2, [r0, #20]
	bne	.L63
	mov	r3, #16
	ldr	lr, [sp], #4
	stm	r0, {r2, r3}
	bx	lr
.L63:
	cmp	r1, #1
	moveq	r2, #152
	moveq	r3, #96
	ldr	lr, [sp], #4
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
	.global	__aeabi_idivmod
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
	ldr	r4, .L80
	ldr	r3, .L80+4
	ldr	r5, [r4, #28]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #1
	ldr	r6, [r4, #32]
	add	r3, r3, r3, lsl r1
	cmp	r5, r3
	str	r6, [r4, #36]
	str	r1, [r4, #32]
	bne	.L69
	ldr	r0, [r4, #40]
	ldr	r3, .L80+8
	ldr	r1, [r4, #48]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #40]
.L69:
	ldr	r3, .L80+12
	ldrh	r3, [r3, #48]
	tst	r3, #32
	moveq	r3, #1
	streq	r3, [r4, #32]
	ldr	r3, .L80+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #16
	ldr	r2, [r4, #64]
	bne	.L71
	cmp	r2, #0
	str	r3, [r4, #32]
	beq	.L72
.L74:
	mov	r2, #1
	mov	r3, #0
	str	r6, [r4, #32]
	str	r2, [r4, #40]
	str	r3, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L71:
	cmp	r2, #0
	bne	.L74
	ldr	r3, [r4, #32]
	cmp	r3, #2
	beq	.L79
.L72:
	add	r5, r5, #1
	str	r5, [r4, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L79:
	str	r2, [r4, #40]
	str	r2, [r4, #28]
	str	r6, [r4, #32]
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	.align	2
.L80:
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
	ldr	r0, .L159
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
	ldr	lr, .L159+4
	ldrh	lr, [lr, #48]
	asr	ip, ip, #10
	asr	r3, r3, #10
	tst	lr, #32
	str	ip, [r0]
	str	r3, [r0, #56]
	bne	.L155
	ldr	lr, [r0, #4]
	cmn	lr, #7
	bge	.L148
.L155:
	ldr	r7, .L159+8
.L84:
	ldr	lr, .L159+4
	ldrh	lr, [lr, #48]
	tst	lr, #16
	bne	.L87
	ldr	r6, [r0, #4]
	cmp	r6, #231
	ble	.L156
.L87:
	ldr	lr, .L159+12
	cmn	r2, #1024
	ldr	r5, [lr]
	ble	.L89
	mov	r1, #1
	cmp	r5, #0
	str	r1, [r0, #64]
	ble	.L90
	ldr	r1, [r0, #12]
	cmp	r1, #43
	bgt	.L90
	sub	r5, r5, r3
	cmp	r3, #0
	str	r5, [lr]
	beq	.L91
	cmp	r5, #352
	bge	.L95
.L97:
	ldr	r5, [lr]
.L98:
	cmp	r5, #0
	movlt	r3, #0
	movlt	r5, r3
	strlt	r3, [lr]
	b	.L100
.L156:
	ldr	lr, [r0, #20]
	ldr	r5, [r0, #60]
	add	lr, r6, lr
	sub	lr, lr, #9
	add	lr, lr, r5
	ldr	r8, .L159+16
	add	r4, lr, ip, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r8, r4]
	cmp	r4, #0
	beq	.L87
	ldr	r4, [r0, #24]
	add	r4, ip, r4
	sub	r4, r4, #1
	add	lr, lr, r4, lsl #8
	lsl	r4, lr, #1
	ldrh	lr, [r8, r4]
	cmp	lr, #0
	beq	.L87
	ldr	r4, [r7]
	add	lr, r6, r5
	cmp	r4, #15
	str	lr, [r0, #4]
	bgt	.L87
	ldr	lr, [r0, #16]
	cmp	lr, #120
	addgt	r5, r5, r4
	strgt	r5, [r7]
	b	.L87
.L148:
	ldr	r6, [r0, #60]
	add	r4, lr, #8
	sub	r4, r4, r6
	ldr	r7, .L159+16
	add	r5, r4, ip, lsl #8
	lsl	r5, r5, #1
	ldrh	r5, [r7, r5]
	cmp	r5, #0
	beq	.L155
	ldr	r5, [r0, #24]
	add	r5, ip, r5
	sub	r5, r5, #1
	add	r4, r4, r5, lsl #8
	lsl	r4, r4, #1
	ldrh	r4, [r7, r4]
	cmp	r4, #0
	ldr	r7, .L159+8
	beq	.L84
	ldr	r4, [r7]
	sub	lr, lr, r6
	cmp	r4, #0
	str	lr, [r0, #4]
	ble	.L84
	ldr	lr, [r0, #16]
	cmp	lr, #119
	suble	r4, r4, r6
	strle	r4, [r7]
	b	.L84
.L90:
	cmp	r3, #0
	bne	.L93
	ldr	r1, [r0, #12]
	cmp	r1, #63
	ble	.L91
.L93:
	cmp	r5, #352
	blt	.L94
.L95:
	cmp	r5, #352
	movne	r5, #352
	strne	r5, [lr]
.L100:
	ldr	r1, [r0, #24]
	ldr	r6, [r0, #4]
	ldr	r3, .L159+16
	add	r1, ip, r1
	add	r4, r6, r1, lsl #8
	add	lr, r3, r4, lsl #1
	ldrh	lr, [lr, #16]
	cmp	lr, #0
	ldr	lr, [r0, #20]
	beq	.L101
	add	r4, r4, lr
	add	r4, r3, r4, lsl #1
	ldrh	r4, [r4, #-18]
	cmp	r4, #0
	bne	.L157
.L101:
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
	b	.L103
.L104:
	mov	r8, #1
	sub	r2, r2, #1
	sub	r3, r3, #512
.L103:
	add	r1, lr, r3
	ldrh	r1, [r1, r4]
	cmp	r1, #0
	beq	.L104
	ldrh	r1, [r3]
	cmp	r1, #0
	beq	.L104
	ldr	r3, .L159+20
	ldrh	r3, [r3]
	cmp	r8, #0
	movne	ip, r2
	strne	r2, [r0]
	tst	r3, #64
	lsl	r1, r2, #10
	beq	.L106
	ldr	r3, .L159+24
	ldrh	r3, [r3]
	tst	r3, #64
	beq	.L158
.L106:
	mov	r3, #0
	str	r3, [r0, #52]
	str	r3, [r0, #64]
.L108:
	ldr	r3, [r7]
	sub	r6, r6, r3
	sub	ip, ip, r5
	str	r6, [r0, #16]
	pop	{r4, r5, r6, r7, r8, lr}
	str	ip, [r0, #12]
	str	r1, [r0, #8]
	b	animatePlayer
.L89:
	mov	r3, #1
	add	r2, r2, #500
	str	r2, [r0, #52]
	str	r3, [r0, #64]
	ldr	r6, [r0, #4]
	add	r1, r1, r2
	b	.L108
.L94:
	ldr	r1, [r0, #12]
	cmp	r1, #84
	ble	.L96
	add	r5, r5, r3
	cmp	r5, #352
	str	r5, [lr]
	bge	.L95
.L96:
	cmp	r1, #64
	movle	r1, #0
	movgt	r1, #1
	cmp	r3, #0
	moveq	r3, r1
	movne	r3, #0
	cmp	r3, #0
	addne	r5, r5, #1
	strne	r5, [lr]
	beq	.L97
	b	.L98
.L157:
	ldr	r3, [r0, #8]
	add	r1, r2, #500
	str	r1, [r0, #52]
	add	r1, r1, r3
	b	.L108
.L158:
	cmp	r2, #0
	ldrgt	r3, .L159+28
	ldrle	r3, [r0, #52]
	strgt	r3, [r0, #52]
	addle	r1, r1, r3
	addgt	r1, r1, r3
	b	.L108
.L91:
	cmp	r5, #0
	ble	.L94
	sub	r5, r5, #1
	str	r5, [lr]
	b	.L93
.L160:
	.align	2
.L159:
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
	ldr	r4, .L170
	ldr	r3, [r4, #28]
	cmp	r3, #160
	sub	sp, sp, #20
	bgt	.L163
	ldr	r1, [r4, #4]
	cmn	r3, r1
	bmi	.L163
	ldr	r2, .L170+4
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L169
.L163:
	ldr	r2, .L170+8
	ldr	r3, .L170+12
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
.L169:
	ldr	ip, .L170+16
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
	ldr	r5, .L170+20
	add	r0, r0, #8
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	movne	r2, #20
	movne	r3, #1
	strne	r2, [r4, #40]
	strne	r3, [r4, #44]
	b	.L163
.L171:
	.align	2
.L170:
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
	ldr	r4, .L186
	ldr	r5, .L186+4
	add	r6, r4, #128
.L175:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L173
	mov	r0, r4
	bl	updateGems.part.0
.L174:
	add	r4, r4, #32
	cmp	r4, r6
	bne	.L175
	ldr	r4, .L186+8
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L176
	mov	r2, #512
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L177:
	ldr	r3, [r4, #80]
	cmp	r3, #0
	bne	.L178
	mov	r2, #512
	ldr	r3, [r4, #84]
	lsl	r3, r3, #3
	strh	r2, [r5, r3]	@ movhi
.L180:
	mov	r7, #512
	ldr	r3, .L186+12
	ldr	r6, .L186+16
	ldr	r4, .L186+20
	add	ip, r3, #72
.L179:
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
	bne	.L179
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L173:
	ldr	r3, [r4, #28]
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L174
.L178:
	ldr	r0, .L186+24
	bl	updateWolves.part.0
	b	.L180
.L176:
	mov	r0, r4
	bl	updateWolves.part.0
	b	.L177
.L187:
	.align	2
.L186:
	.word	gems
	.word	shadowOAM
	.word	wolves
	.word	hearts
	.word	511
	.word	4144
	.word	wolves+56
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
.L189:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L190
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L191:
	.align	2
.L190:
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
.L193:
	mov	r1, #512
	ldr	r3, [r0, #28]
	ldr	r2, .L194
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L195:
	.align	2
.L194:
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
	beq	.L197
	ldr	r2, [r0, #4]
	ldr	r1, .L203
	str	lr, [sp, #-4]!
	lsl	r2, r2, #23
	ldrb	lr, [r0]	@ zero_extendqisi2
	ldr	r0, .L203+4
	lsl	ip, r3, #3
	lsr	r2, r2, #23
	add	r3, r1, r3, lsl #3
	strh	lr, [r1, ip]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r0, [r3, #4]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L197:
	mov	r1, #512
	ldr	r2, .L203
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L204:
	.align	2
.L203:
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
	ldr	r1, .L206
	ldr	r3, [r1, #16]
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	ldr	ip, [r1, #40]
	ldr	r2, [r1, #32]
	ldr	r0, .L206+4
	ldrb	r1, [r1, #12]	@ zero_extendqisi2
	add	r2, r2, ip, lsl #5
	lsl	r2, r2, #2
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r2, [r0, #4]	@ movhi
	bx	lr
.L207:
	.align	2
.L206:
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
	ldr	r1, .L210
	ldr	r2, [r1, #4]
	ldr	r3, [r1, #28]
	ldr	r0, .L210+4
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
.L211:
	.align	2
.L210:
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
	ldr	r0, .L214
	ldr	r3, .L214+4
	ldr	r1, [r0, #4]
	ldr	r2, [r3]
	ldr	ip, .L214+8
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
.L215:
	.align	2
.L214:
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
	ldr	r2, .L223
	ldr	r1, [r2, #28]
	cmp	r1, #160
	ldr	r3, [r2, #8]
	bgt	.L217
	ldr	r0, [r2, #4]
	cmn	r1, r0
	bmi	.L217
	ldr	r0, [r2, #20]
	lsl	r0, r0, #23
	lsr	r0, r0, #23
	mvn	r0, r0, lsl #17
	mvn	r0, r0, lsr #17
	ldr	r2, [r2, #40]
	ldr	ip, .L223+4
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
.L217:
	mov	r1, #512
	ldr	r2, .L223+4
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L224:
	.align	2
.L223:
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
	ldr	r1, .L227
	ldr	r0, .L227+4
	ldr	r3, [r1, #16]
	and	r3, r3, r0
	mvn	r3, r3, lsl #17
	mvn	r3, r3, lsr #17
	push	{r4, r5, r6, r7, r8, lr}
	mov	lr, #16
	ldr	r4, .L227+8
	ldr	r2, .L227+12
	ldr	r7, [r1, #40]
	ldr	r2, [r2]
	ldr	r5, .L227+16
	strh	r3, [r4, #2]	@ movhi
	ldr	r3, [r1, #32]
	ldrb	r6, [r1, #12]	@ zero_extendqisi2
	add	r3, r3, r7, lsl #5
	ldr	r1, [r5, #28]
	ldr	ip, .L227+20
	strh	r6, [r4]	@ movhi
	lsl	r3, r3, #2
	ldrb	r6, [r5]	@ zero_extendqisi2
	ldr	r5, [r5, #4]
	strh	r3, [r4, #4]	@ movhi
	lsl	r3, r1, #3
	strh	r6, [r4, r3]	@ movhi
	ldr	r3, [ip, #4]
	and	r5, r5, r0
	and	r0, r0, r3
	ldr	r3, [ip, #16]
	add	r1, r4, r1, lsl #3
	ldrb	ip, [ip]	@ zero_extendqisi2
	lsl	r2, r2, #5
	strh	lr, [r1, #4]	@ movhi
	strh	r5, [r1, #2]	@ movhi
	add	r2, r2, #80
	lsl	r1, r3, #3
	add	r3, r4, r3, lsl #3
	strh	ip, [r4, r1]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	bl	drawStatue
	ldr	r3, .L227+24
	mov	lr, pc
	bx	r3
	mov	r1, r4
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r4, .L227+28
	mov	lr, pc
	bx	r4
	mov	r0, #67108864
	ldr	r3, .L227+32
	ldr	r3, [r3]
	lsl	r2, r3, #16
	lsr	r2, r2, #16
	strh	r2, [r0, #20]	@ movhi
	ldr	r2, .L227+36
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
	pop	{r4, r5, r6, r7, r8, lr}
	strh	r3, [r0, #24]	@ movhi
	strh	r1, [r0, #26]	@ movhi
	bx	lr
.L228:
	.align	2
.L227:
	.word	player
	.word	511
	.word	shadowOAM
	.word	gemsRemaining
	.word	gemCounterIcon
	.word	gemNum
	.word	waitForVBlank
	.word	DMANow
	.word	hOff
	.word	vOff
	.size	drawGame, .-drawGame
	.comm	statue,52,4
	.comm	hearts,72,4
	.comm	gemNum,20,4
	.comm	wolves,112,4
	.comm	blocks,160,4
	.comm	gemCounterIcon,32,4
	.comm	gems,128,4
	.comm	player,68,4
	.comm	statueLivesRemaining,4,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
