init:
	cbi 0x17,4
	sbi 0x17,3
	sbi 0x18,4


main:
	sbis 0x16,4
	sbi 0x18,3
	
	sbic 0x16,4
	cbi 0x18,3

 rjmp main