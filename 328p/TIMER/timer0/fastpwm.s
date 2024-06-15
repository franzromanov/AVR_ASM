.text
.org 0x000
.equ DDRD,0x0A
.equ TCCR0A,0x24
.equ TCCR0B,0x25
.equ OCR0A,0x27
.equ TIFR0,0x15
.equ SREG,0x3F
.equ TIMSK0,0x6E


main:
	ldi r16,9
	call load_OCRNn
	ldi r16,12
	call load_OCRNn
	rjmp main

load_OCRNn:
	out OCR0A,r16
fastpwm_init:
	ldi r16,(1<<6)
	out DDRD,r16
	ldi r16,(1<<0)|(1<<1)|(1<<7)
	out TCCR0A,r16
	ldi r16,(1<<2)|(1<<0)
	out TCCR0B,r16
	ret