	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r3, r4, lr}	@ Delete r5, reduce register 
		
	subs r3,r0,#1		@ If n-1 is 0 or 1, return
	it le
	pople {r3, r4, pc}

	mov r0,r3	 
	bl fibonacci	@ If n-1 > 1, recursive call to fibonacci with n-1 as parameter 

	mov r4,r0	@ R4 = R0 = n-1
	sub r0,r3,#1	@ R0 = R4 - 1 = n-2
	bl fibonacci	@ Recursive call to fibonacci with n-2 as parameter 

	adds r0,r0,r4	@ R0 = R0 + R4 (update flags)

	pop {r3, r4, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
