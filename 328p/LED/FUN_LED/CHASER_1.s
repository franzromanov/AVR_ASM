;PB 5-PB 0; PD6&PD7

;PORT_DEF
.equ PORTB,0x05
.equ PORTD,0x0B

;DDR_DEF
.equ DDRB,0x04
.equ DDRD,0x0A


main:
	;set all_DDR_TO_1
	ldi r18, 0x3F
	out DDRB,r18
	ldi r18,(1<<6)|(1<<7)
	out DDRD,r18

	;LED_ON
	sbi PORTB,5
	rcall delay_init
	cbi PORTB,5
	rcall delay_init

	;LED_ON
	sbi PORTB,4
	rcall delay_init
	cbi PORTB,4
	rcall delay_init

	;LED_ON
	sbi PORTB,3
	rcall delay_init
	cbi PORTB,3
	rcall delay_init

	;LED_ON
	sbi PORTB,2
	rcall delay_init
	cbi PORTB,2
	rcall delay_init

	;LED_ON
	sbi PORTB,1
	rcall delay_init
	cbi PORTB,1
	rcall delay_init

	;LED_ON
	sbi PORTB,0
	rcall delay_init
	cbi PORTB,0
	rcall delay_init

	;LED_ON
	sbi PORTD,7
	rcall delay_init
	cbi PORTD,7
	rcall delay_init

	;LED_ON
	sbi PORTD,6
	rcall delay_init
	cbi PORTD,6
	rcall delay_init
	rjmp main

;subroutine_delay
delay_init:
    ldi r16,0x11
    ldi r17,0x00
    ldi r24,0xff


delay:
    dec r24
    brne delay
    dec r25
    brne delay
    dec r16
    cp r17,r16
    brne delay
    ret