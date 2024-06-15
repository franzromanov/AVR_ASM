.text
.org 0x000

main:
	sbi 0x17,3
	sbi 0x18,3
	rcall delay_init
	cbi 0x18,3
	rcall delay_init
	rjmp main

;subroutine_delay
delay_init:
    ldi r16,0x02
    ldi r24,0x02
    ldi r25,0x02

delay:
    dec r24
    brne delay
    dec r25
    brne delay
    dec r16
    brne delay
    ret
