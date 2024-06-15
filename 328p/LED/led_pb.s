.equ DDRB,0x04
.equ PORTB,0x05
.equ PINB,0x03


set:
	ldi r16, 1<<5
	out DDRB,r16
	;out PORTB,r16
	ldi r16, (1<<5)&~(1<<0)
	out DDRB, r16
	ldi r16, (1<<0)
	out PORTB, r16
	ldi r17, 0x00

LED:
	ldi r16,(0<<5)|(1<<0)
	out PORTB, r16
	call while
while:
	in r16,PINB
	cp r16,r17
	brne LED
        ldi r16,(1<<5)|(1<<0)
        out PORTB, r16
	rjmp while
