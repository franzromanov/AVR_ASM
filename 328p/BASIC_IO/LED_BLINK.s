;BLINK_ON_PB5

;PORT_DEF
.equ PORTB,0x05
.equ PORTD,0x0B

;DDR_DEF
.equ DDRB,0x04

main:

	sbi DDRB,5

	;LED_ON
	sbi PORTB,5
	rcall delay_init
	cbi PORTB,5
	rcall delay_init
	rjmp main

;subroutine_delay
delay_init:
    ldi r16,0x17
    ldi r24,0x07
    ldi r25,0x07

delay:
    dec r24
    brne delay
    dec r25
    brne delay
    dec r16
    brne delay
    ret
