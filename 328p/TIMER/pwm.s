.equ ledA,200
.equ ledB,2

;I/O
.equ DDRD, 0x0A
.equ PORTD,0x0B

;TIMER
.equ TCCR0B,0x25
.equ TCCR0A,0x24
.equ OCR0A,0x27
.equ OCR0B,0x28

START:
	r16, (1<<6)|(1<<5)
	out DDRD,r16
	in r21,DDRD
	r16,0x00
	out PORTD,r16
	in r22,PORTD

PWM_INIT:
	ldi r16,(1<<0)|(1<<7)|(1<<5)
	out TCCR0A,r16
	in r17,TCCR0A;for debugging
	ldi r16,(1<<0)|(1<<2)
	out TCCR0B,r16
	in r18,TCCR0B;for debugging
	ldi r16, ledA
	out OCR0A,r16
	in r19,OCR0A;for debugging
	ldi r16,ledB
	out OCR0B,r16
	in r20,OCR0B;for debugging