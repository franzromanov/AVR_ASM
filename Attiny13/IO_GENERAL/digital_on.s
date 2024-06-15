.text
.org 0x000

main:
	sbi 0x17,3
	sbi 0x18,3

	rjmp main

