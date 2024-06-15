;PB 5-PB 0; PD6&PD7

;PORT_DEF
.equ PORTB,0x05
.equ PORTD,0x0B
.equ PINB,0x03
;DDR_DEF
.equ DDRB,0x04
.equ DDRD,0x0A

init:
	cbi DDRB,5
main:
	

	in r16,PINB
	sbrc r16,5
	call animate_
	call delay_init
	rjmp main


animate_:
	sbi DDRD,7
	sbi PORTD,7
	call delay_init
	cbi PORTD,7
	call delay_init
	cbi DDRD,7

	sbi DDRD,6
	sbi PORTD,6
	call delay_init
	cbi PORTD,6
	call delay_init
	cbi DDRD,6

	sbi DDRD,5
	sbi PORTD,5
	call delay_init
	cbi PORTD,5
	call delay_init
	cbi DDRD,5

	sbi DDRD,4
	sbi PORTD,4
	call delay_init
	cbi PORTD,4
	call delay_init
	cbi DDRD,4
	ret

;subroutine_delay
delay_init:
	ldi r25,0xf
	ldi r24,0x3
	ldi r23,0x3

delay:
    dec r25
    brne delay
    dec r24
    brne delay
    dec r23
    brne delay
    ret