;(13+9)*6-19
.text
.org 0x000

main:
	ldi r16,13
	ldi r17,9
	add r16,r17
	ldi r17,6
	mul r16,r17
	ldi r17,19
	clr r16
	mov r16,r1
	cpi r16,0
	brne high_active
	sub r0,r17
	rjmp main
	high_active:
		sub r0,r17
		sbci r16,0
		mov r0,r16
		clr r16
		rjmp main