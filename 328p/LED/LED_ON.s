.equ PORTB, 0x05
.equ DDRB, 0x04


main:
	ldi r16,(1<<3)|(1<<4)
	out DDRB ,r16
	rcall ledA
	rcall ledB
	rjmp main

ledA:
	ldi r16,0<<3
	out PORTB,r16
	ret

ledB:
	ldi r16, 1<<4
	out PORTB,r16
	ret	

