L1:
	ldi r16,0xff
	call L2
	rjmp L3
L2:
	ldi r17, 0xff
	ret
L3:
	dec r17
	;cpi r17,0x00
	brne L1
