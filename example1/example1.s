	.syntax unified
	.arch armv7-a
	.eabi_attribute 27, 3
	.eabi_attribute 28, 1
	.fpu vfpv3-d16
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.thumb
	.file	"example1.c"
	.text
	.align	2
	.global	main
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	movs	r3, #12
	str	r3, [r7, #4]
	movs	r3, #12
	str	r3, [r7, #8]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #4]
	bl	div
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.global	__aeabi_idiv
	.align	2
	.global	div
	.thumb
	.thumb_func
	.type	div, %function
div:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r1, [r7]
	ldr	r0, [r7, #4]
	bl	__aeabi_idiv
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	div, .-div
	.ident	"GCC: (Ubuntu/Linaro 4.9.1-16ubuntu6) 4.9.1"
	.section	.note.GNU-stack,"",%progbits
