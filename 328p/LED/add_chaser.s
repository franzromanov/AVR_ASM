.equ PORTB,0x05
.equ DDRB,0x04
.equ DDRD,0x0A
.equ SREG,0x3F
.equ PORTD,0x0B
init:
	ldi r19,63
	out DDRB,r19
	ldi r19,(1<<7)|(1<<6)
	out DDRD,r19
	clr r19

main:
	mov r18,r19
	call init_shift
	inc r19
	cpi r19,0xFF
	in r16, SREG
	SBRC r16,1
	call intermed
	out PORTB,r17
	out PORTD,r18
	call delay_init
	;call delay_init
	rjmp main

intermed:
	clr r19
	clr r18
	com 18
	call init_shift
	ret

;--------for_shifting
init_shift:
    mov r17,r18
    ldi r16,0x02

loop_1:
    lsr r17
    dec r16
    brne loop_1
    ldi r16,0x06
loop_2:
    lsl r18
    dec r16
    brne loop_2
    ret

;subroutine_delay
delay_init:
    ldi r16,0x08
    ldi r24,0x08
    ldi r25,0x08

delay:
    dec r24
    brne delay
    dec r25
    brne delay
    dec r16
    brne delay
    ret