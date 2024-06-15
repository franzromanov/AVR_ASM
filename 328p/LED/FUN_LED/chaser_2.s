.text
.org 0x0000
;chaser_mode_2:LOW_LOGIC_SHIFT_MOVE
;-------------defining_PORT
.equ DDRD,0x0A
.equ DDRB,0x04
.equ PORTB,0x05
.equ PORTD,0x0B
.equ SREG,0x3F

INIT:
	ldi r16,0x1F
	out DDRB,r16
	ldi r16,0xC0
	out DDRD,r16
	

start_:
	clr r17
	mov r18,r17
	call INIT_SHIFT
	out PORTD,r18
	out PORTB,r19
	ldi r17,0x01
	mov r18,r17
	call INIT_SHIFT
	out PORTD,r18
	out PORTB,r19
main:
	lsr r17
	mov r18,r17
	call INIT_SHIFT
;------------------OUT
	out PORTD,r18
	out PORTB,r19
	call DELAY_INIT
;---------------------

	cpi r17,128
	brne start_
	rjmp main

;---subroutine

INIT_SHIFT:
	com r18
	mov r19,r18
	ldi r16,0x06
LSB:
	dec r16
	lsl r18
	brne LSB
	ldi r16,0x02
MSB:
	dec r16
	lsr r19
	brne MSB
	ret

DELAY_INIT:
	ldi r16,0x09
	ldi r22,0xFF
	ldi r23,0x09
unit_1:
	dec r16
	brne unit_1
	dec r20
	brne unit_1
	dec r21
	brne unit_1
	ret






