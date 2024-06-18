.org 0x000
reset:
	rjmp init_timer

.org 0x010
reset_overflow:
	sbi 0x15,0
	reti

init_timer:
	ldi r16,0b101
	out 0x25,16
	ldi r16,0b1
	sts 0x6E,r16
	clr r16

init_GPIO:
	sbi 0x17,3

main:
	sbi 0x18,3
	rcall delay
	cbi 0x18,3
	rcall delay

	rjmp main

delay:
	ldi r16, 63

subprocess:
	sbic 0x15,0
	dec r16
	cpi r16,0
	breq timer_done
	rjmp subprocess

timer_done:
	ret



