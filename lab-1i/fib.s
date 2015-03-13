	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function


	@According to PPT P71 Sample algorithms
fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, r5,r6, lr}
	mov r3,#-1					@int previous = -1;
	mov r4,#1					@int result = 1;
	mov r5,#0					@int i = 0;
	mov r6,#0					@int sum = 0;
					
forloop:						@for loop
	add r6,r4,r3					@sum = result+previous;
	mov r3,r4					@privious = result;
	mov r4,r6					@result = sum;
	
	add r5,#1					@i=i+1
	CMP r0,r5					@CMP=compare, x-i>0
	it ge						@if then, ge= >=
	bge forloop					@next forloop

	mov r0,r6					@r0 is return
	pop {r3, r4, r5,r6,pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	mov r0, #0			@ R0 = 0
	pop {r3, r4, r5, pc}		@ EPILOG

.L4:
	mov r0, #1			@ R0 = 1
	pop {r3, r4, r5, pc}		@ EPILOG

	.size fibonacci, .-fibonacci
	.end
