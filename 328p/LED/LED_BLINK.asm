.equ F_CPU=16000000
.include "m328pdef.inc"
SET_IO:
	ldi r16, (1<<7)
	sts CLKPR,r16
	ldi r16, (1<<3)|(0<<2)|(0<<1)|(0<<0)
	sts CLKPR, r16 
main:

	ldi r16,(1<<4)
	out DDRB,r16
	out PORTB,r16
	rcall delay
	rcall delay
	rcall delay
	rcall delay
	rcall delay
	ldi r16,(0<<4)
	out PORTB,r16
	out DDRB,r16
	rcall delay
	rcall delay
	rcall delay
	rcall delay
	rcall delay
	rjmp main

delay:
	ldi r17,(1<<1)
	out TCCR0A,r17
	ldi r17, (1<<2)|(1<<0)
	out TCCR0B,r17
	ldi r17, 0x9B
	out OCR0A,r17
interrupt:
	in r17,TIFR0
	cpi r17,(0<<1)
	brne interrupt
	ldi r17, (1<<1)
	out TIFR0,r17
	ret
