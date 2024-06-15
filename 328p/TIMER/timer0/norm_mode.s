 .text
;define_addr
.org 0x000
.equ TCCR0A, 0x24
.equ TCCR0B, 0x25
.equ TCNT0,	 0x26
.equ OCR0A,	 0x27
.equ OCR0B,	 0x28
.equ TIMSK0, 0x6E
.equ TIFR0,	 0x15
.equ DDRB,	 0x04
.equ PORTB,	 0x05

/*
--ticks=second/(prescaler*1000/cpu_clock)
--ticks=number of when the counter reach overflow state
*/


;------------start

;---init_timer
init_norm:
	;just_set_prescaler
	ldi r16,(1<<2)|(1<<0);prscaler: 1023
	out TCCR0B,r16
load_ticks:
	ldi r28,255
	ldi r29,0
	sbi DDRB, 5
;-------------main
	
main:

	sbi PORTB, 5
	call delay
	cbi PORTB, 5
	call delay
	rjmp main

;-----subroutine
delay:
	dec r28
	call timer_
	breq buffer_1
	rjmp carry
buffer_1:
	cpi r29,0x00
	breq buffer_2
	rjmp carry
buffer_2:
	ret
carry:
	sbci r29,0x00
	rjmp delay
timer_:
	sbis TIFR0,0
	rjmp timer_
	sbi TIFR0,0
	ret










