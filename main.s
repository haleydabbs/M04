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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #4096
	orr	r3, r3, #1024
	strh	r3, [r4]	@ movhi
	ldr	r5, .L4
	mov	r3, #7808
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #0
	ldr	r3, .L4+20
	ldr	r1, .L4+24
	ldrh	r3, [r3]
	ldrh	r1, [r1]
	strh	r3, [r4, #24]	@ movhi
	ldr	r3, .L4+28
	strh	r1, [r4, #26]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	100679680
	.word	startBGTiles
	.word	100704256
	.word	startBGMap
	.word	hOff_1
	.word	vOff_1
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #34304
	mov	r5, #67108864
	ldr	r4, .L8
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #1264
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+4
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r2, #4096
	ldr	r3, .L8+16
	strh	r2, [r5]	@ movhi
	strh	r3, [r5, #12]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L8+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L8+24
	ldr	r2, .L8+28
	pop	{r4, r5, r6, lr}
	str	r3, [r1]
	str	r3, [r2]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	platformsBGTiles
	.word	100675584
	.word	platformsBGMap
	.word	5124
	.word	loseBGPal
	.word	vOff_1
	.word	hOff_1
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	win.part.0, %function
win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L13:
	.align	2
.L12:
	.word	buttons
	.size	win.part.0, .-win.part.0
	.set	lose.part.0,win.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #4048
	ldr	r4, .L16
	mov	r0, #3
	ldr	r2, .L16+4
	ldr	r1, .L16+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+12
	mov	r0, #3
	ldr	r1, .L16+16
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	100679680
	.word	InstructionsBGTiles
	.word	100704256
	.word	InstructionsBGMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #10048
	ldr	r4, .L20
	mov	r0, #3
	ldr	r2, .L20+4
	ldr	r1, .L20+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L20+12
	ldr	r1, .L20+16
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r0, #2
	ldrh	r3, [r2]
	ldr	r1, .L20+20
	orr	r3, r3, #5632
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	100679680
	.word	gameBGTiles
	.word	100704256
	.word	gameBGMap
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L34
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L34+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L22:
	pop	{r4, lr}
	bx	lr
.L33:
	pop	{r4, lr}
	b	goToInstructions
.L32:
	ldr	r3, .L34+8
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldrh	r3, [r4]
	b	.L23
.L35:
	.align	2
.L34:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L48
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L37
	ldr	r2, .L48+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L46
.L37:
	tst	r3, #8
	beq	.L36
	ldr	r3, .L48+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L47
.L36:
	pop	{r4, lr}
	bx	lr
.L47:
	ldr	r3, .L48+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L46:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #4096
	strh	r3, [r4]	@ movhi
	ldr	r5, .L52
	mov	r3, #3248
	mov	r0, #3
	ldr	r2, .L52+4
	ldr	r1, .L52+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L52+12
	ldr	r1, .L52+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #3
	ldr	r3, .L52+20
	ldr	r1, .L52+24
	ldrh	r3, [r3]
	ldrh	r1, [r1]
	strh	r3, [r4, #24]	@ movhi
	ldr	r3, .L52+28
	strh	r1, [r4, #26]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	DMANow
	.word	100679680
	.word	pauseBGTiles
	.word	100704256
	.word	pauseBGMap
	.word	hOff_1
	.word	vOff_1
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L59
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L59+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToGame
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #4096
	strh	r3, [r4]	@ movhi
	ldr	r5, .L63
	mov	r3, #1696
	mov	r0, #3
	ldr	r2, .L63+4
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L63+12
	ldr	r1, .L63+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #4
	ldr	r3, .L63+20
	ldr	r1, .L63+24
	ldrh	r3, [r3]
	ldrh	r1, [r1]
	strh	r3, [r4, #24]	@ movhi
	ldr	r3, .L63+28
	strh	r1, [r4, #26]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	100679680
	.word	winBGTiles
	.word	100704256
	.word	winBGMap
	.word	hOff_1
	.word	vOff_1
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #4096
	strh	r3, [r4]	@ movhi
	ldr	r5, .L67
	mov	r3, #3056
	mov	r0, #3
	ldr	r2, .L67+4
	ldr	r1, .L67+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L67+12
	ldr	r1, .L67+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r2, #5
	ldr	r3, .L67+20
	ldr	r1, .L67+24
	ldrh	r3, [r3]
	ldrh	r1, [r1]
	strh	r3, [r4, #24]	@ movhi
	ldr	r3, .L67+28
	strh	r1, [r4, #26]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L68:
	.align	2
.L67:
	.word	DMANow
	.word	100679680
	.word	loseBGTiles
	.word	100704256
	.word	loseBGMap
	.word	hOff_1
	.word	vOff_1
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L80
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L80+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L70
	ldr	r3, .L80+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L77
.L70:
	ldr	r3, .L80+16
	ldr	r3, [r3, #44]
	cmp	r3, #0
	bne	.L78
	ldr	r3, .L80+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L79
	pop	{r4, lr}
	bx	lr
.L78:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToWin
.L79:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToLose
.L77:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToPause
.L81:
	.align	2
.L80:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
	.word	statue
	.word	livesRemaining
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L100
	ldr	r10, .L100+4
	push	{r4, r7, fp, lr}
	ldr	r3, .L100+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L100+12
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L100+16
	ldr	r8, .L100+20
	ldr	r7, .L100+24
	ldr	fp, .L100+28
	ldr	r4, .L100+32
.L84:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L93
.L86:
	.word	.L91
	.word	.L90
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L85
.L85:
	tst	r0, #8
	beq	.L93
	ldr	r3, .L100+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L87:
	tst	r0, #8
	beq	.L93
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L88:
	tst	r0, #8
	beq	.L93
	tst	r3, #8
	beq	.L99
.L93:
	mov	r0, r3
	b	.L84
.L89:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L91:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L90:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L99:
	ldr	r3, .L100+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L84
.L101:
	.align	2
.L100:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	win.part.0
	.word	67109120
	.word	lose.part.0
	.word	goToGame
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L104
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.0
.L105:
	.align	2
.L104:
	.word	oldButtons
	.size	lose, .-lose
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	lose
	.size	win, .-win
	.comm	state,4,4
	.comm	hOff_1,4,4
	.comm	vOff_1,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
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
