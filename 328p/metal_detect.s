init:
	cbi 0x04,0
	sbi 0x04,5

main:
	
	in r16,0x03
	sbrs r16,0
	sbi 0x05,5

	in r16,0x03
	sbrc r16,0
	cbi 0x05,5

	rjmp main
