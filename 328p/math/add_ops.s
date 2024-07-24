.text
.org 0x000

main:
	ldi r16,20
	mov r1,r16
	ldi r16,10
	add r16,r1
	clr r1
	rjmp main
