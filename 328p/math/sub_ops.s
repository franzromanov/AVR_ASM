;without-overflow

main:
	ldi r16,5
	mov r1,r16
	ldi r16,20
	sub r16,r1
	clr r1
	rjmp main