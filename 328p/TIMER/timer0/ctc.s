.text
.equ DDRD,0x0A
.equ TCCR0A,0x24
.equ TCCR0B,0x25
.equ OCR0A,0x27
.equ TIFR0,0x15
.equ SREG,0x3F
.equ TIMSK0,0x6E

define:
	sbi 0x04,5
main:
	sbi 0x05,5
	call delay
	cbi 0x05,5
	call delay
	rjmp main

delay:
	ldi r17,5
	ldi r16,(1<<6)
	out DDRD,r16
	ldi r16,(1<<6)|(1<<1)
	out TCCR0A,r16
	;prescaler
	ldi r16,(1<<0)|(1<<2)
	out TCCR0B,r16
load_OCRNn:
	ldi r16,156
	out OCR0A,r16
check interrupt:
	
