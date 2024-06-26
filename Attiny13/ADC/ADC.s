GPIO_INIT:	
	sbi 0x17,3
main:
	rcall READ_ANALOG
	in r18,0x04
	in r17,0x05
	ldi r16,0
	sub r16,r17
	in r19,0x3F
	sbrs r19,2
	rjmp check_low

	clr r19
	clr r16
	rjmp turn_off

check_low:
	ldi r20,0
	sub r20,r18
	in r19,0x3F
	sbrs r19,2
	cbi 0x18,3
	rjmp edge
turn_off:
	sbi 0x18,3
	rjmp edge
edge:
	rjmp main

READ_ANALOG:
	ldi r16,(1<<0)
	out 0x07,r16
	ldi r16,(1<<7)|(1<<2)|(1<<1)|(1<<0)|(1<<6)
	out 0x06,r16
wait_conversion:
	in r16,0x06 
	sbrs r16,6
	rjmp wait_conversion
	ret



