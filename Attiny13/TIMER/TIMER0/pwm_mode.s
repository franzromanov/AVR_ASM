init_GPIO:
	sbi 0x17,0
init_timer:
	ldi r16,(1<<7)|(1<<1)|(1<<0)
	out 0x2F,r16
	ldi r16,(1<<2)|(1<<0)
	out 0x33,r16
	ldi r16,10
	out 0x36,r16

main:
	
	rjmp main

