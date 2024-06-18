init_GPIO:
	sbi 0x17,0
	sbi 0x17,3

init_timer:
	ldi r16,(1<<1)
	out 0x2F,r16 ;TCCR0A
	ldi r16,(1<<2)|(1<<0)	
	out 0x33,r16	;TCCR0B
	ldi r16,255
	out 0x36,r16
	clr r16

main:
	sbi 0x18,3
	rcall delay
	cbi 0x18,3
	rcall delay

	rjmp main

delay:
	ldi r16,2

subprocess:
	in r17,0x38
	sbrc r17,2
	rcall flag
	cpi r16,0
	breq timer_done
	rjmp subprocess

timer_done:
	ret
flag:
	dec r16
	ldi r17,(1<<2)
	out 0x38,r17
	ret
