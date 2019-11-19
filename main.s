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
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #256
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4
	mov	r3, #896
	mov	r2, #100663296
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+8
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L4+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startBGTiles
	.word	100675584
	.word	startBGMap
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
	mov	r3, #1536
	mov	r5, #67108864
	ldr	r2, .L8
	ldr	r4, .L8+4
	strh	r3, [r5, #8]	@ movhi
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	mov	r3, #1152
	ldr	r2, .L8+8
	ldr	r1, .L8+12
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	mov	r0, #3
	ldr	r2, .L8+16
	ldr	r1, .L8+20
	mov	lr, pc
	bx	r4
	ldr	r2, .L8+24
	mov	r3, #32
	strh	r2, [r5, #12]	@ movhi
	mov	r0, #3
	ldr	r2, .L8+28
	ldr	r1, .L8+32
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L8+36
	ldr	r1, .L8+40
	mov	lr, pc
	bx	r4
	mov	r2, #4096
	mov	r3, #256
	strh	r2, [r5]	@ movhi
	mov	r0, #3
	mov	r2, #83886080
	ldr	r1, .L8+44
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	b	goToStart
.L9:
	.align	2
.L8:
	.word	-29180
	.word	DMANow
	.word	100679680
	.word	platformsBGTiles
	.word	100691968
	.word	platformsBGMap
	.word	5128
	.word	100696064
	.word	gameBGTiles
	.word	100704256
	.word	gameBGMap
	.word	platformsBGPal
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
	mov	r3, #1056
	ldr	r4, .L16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L16+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+8
	mov	r0, #3
	ldr	r1, .L16+12
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L16+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L17:
	.align	2
.L16:
	.word	DMANow
	.word	InstructionsBGTiles
	.word	100675584
	.word	InstructionsBGMap
	.word	state
	.size	goToInstructions, .-goToInstructions
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
	push	{r4, r5, r6, lr}
	ldr	r4, .L30
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L19
	ldr	r2, .L30+4
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L28
.L19:
	tst	r3, #4
	beq	.L18
	ldr	r3, .L30+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L29
.L18:
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	pop	{r4, r5, r6, lr}
	b	goToInstructions
.L28:
	mov	r5, #67108864
	ldrh	r3, [r5]
	bic	r3, r3, #256
	strh	r3, [r5]	@ movhi
	ldr	r3, .L30+8
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldrh	r3, [r5]
	orr	r3, r3, #5632
	strh	r3, [r5]	@ movhi
	ldr	r2, .L30+12
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L19
.L31:
	.align	2
.L30:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	state
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
	ldr	r4, .L44
	ldrh	r3, [r4]
	tst	r3, #4
	beq	.L33
	ldr	r2, .L44+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L42
.L33:
	tst	r3, #8
	beq	.L32
	ldr	r3, .L44+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L43
.L32:
	pop	{r4, lr}
	bx	lr
.L43:
	mov	r4, #67108864
	ldrh	r3, [r4]
	bic	r3, r3, #256
	strh	r3, [r4]	@ movhi
	ldr	r3, .L44+8
	mov	lr, pc
	bx	r3
	mov	r1, #2
	ldrh	r3, [r4]
	ldr	r2, .L44+12
	orr	r3, r3, #5632
	strh	r3, [r4]	@ movhi
	str	r1, [r2]
	pop	{r4, lr}
	bx	lr
.L42:
	bl	goToStart
	ldrh	r3, [r4]
	b	.L33
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.word	initGame
	.word	state
	.size	instructions, .-instructions
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
	@ link register save eliminated.
	mov	r2, #67108864
	mov	r0, #2
	ldrh	r3, [r2]
	ldr	r1, .L47
	orr	r3, r3, #5632
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L48:
	.align	2
.L47:
	.word	state
	.size	goToGame, .-goToGame
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
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #256
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L51
	mov	r3, #928
	mov	r2, #100663296
	ldr	r1, .L51+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L51+8
	mov	r0, #3
	ldr	r1, .L51+12
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L51+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	DMANow
	.word	pauseBGTiles
	.word	100675584
	.word	pauseBGMap
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
	ldr	r3, .L58
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L58+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r2, #67108864
	mov	r0, #2
	ldrh	r3, [r2]
	ldr	r1, .L58+8
	bic	r3, r3, #256
	orr	r3, r3, #5632
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L59:
	.align	2
.L58:
	.word	oldButtons
	.word	buttons
	.word	state
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
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #256
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L62
	mov	r3, #848
	mov	r2, #100663296
	ldr	r1, .L62+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L62+8
	mov	r0, #3
	ldr	r1, .L62+12
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L62+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L63:
	.align	2
.L62:
	.word	DMANow
	.word	winBGTiles
	.word	100675584
	.word	winBGMap
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
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #4096
	orr	r3, r3, #256
	push	{r4, lr}
	mov	r0, #3
	strh	r3, [r2]	@ movhi
	ldr	r4, .L66
	mov	r3, #864
	mov	r2, #100663296
	ldr	r1, .L66+4
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+8
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	mov	r2, #5
	ldr	r3, .L66+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L67:
	.align	2
.L66:
	.word	DMANow
	.word	loseBGTiles
	.word	100675584
	.word	loseBGMap
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
	ldr	r3, .L85
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L85+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r2, .L85+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L82
.L69:
	tst	r3, #1
	beq	.L70
	ldr	r2, .L85+12
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L83
.L70:
	tst	r3, #2
	beq	.L68
	ldr	r3, .L85+12
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L84
.L68:
	pop	{r4, lr}
	bx	lr
.L82:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToPause
.L83:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToWin
.L84:
	mov	r2, #67108864
	ldrh	r3, [r2]
	bic	r3, r3, #512
	strh	r3, [r2]	@ movhi
	pop	{r4, lr}
	b	goToLose
.L86:
	.align	2
.L85:
	.word	updateGame
	.word	drawGame
	.word	oldButtons
	.word	buttons
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
	push	{r4, r7, fp, lr}
	ldr	r6, .L102
	ldr	fp, .L102+4
	ldr	r3, .L102+8
	mov	lr, pc
	bx	r3
	ldr	r5, .L102+12
	ldr	r2, [r6]
	ldrh	r0, [fp]
	ldr	r10, .L102+16
	ldr	r9, .L102+20
	ldr	r8, .L102+24
	ldr	r7, .L102+28
	ldr	r4, .L102+32
.L89:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L98
.L91:
	.word	.L96
	.word	.L95
	.word	.L94
	.word	.L93
	.word	.L92
	.word	.L90
.L90:
	tst	r0, #8
	beq	.L98
	ldr	r3, .L102+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L92:
	tst	r0, #8
	beq	.L98
	ldr	r3, .L102+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L93:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L94:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L95:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L96:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L89
.L98:
	mov	r0, r3
	b	.L89
.L103:
	.align	2
.L102:
	.word	state
	.word	buttons
	.word	initialize
	.word	oldButtons
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	67109120
	.word	lose.part.0
	.word	win.part.0
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
	ldr	r3, .L106
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	lose.part.0
.L107:
	.align	2
.L106:
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
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	wolves,104,4
	.comm	blocks,160,4
	.comm	gems,128,4
	.comm	player,56,4
	.comm	livesRemaining,4,4
	.comm	gemsRemaining,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
