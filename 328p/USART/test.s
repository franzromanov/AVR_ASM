.equ SREG, 0x3F

label:
ldi r16,0x00
ldi r18,3
ldi r17,90
subi r17,100
sbci r18,0x00
cpi r16,0x00
in r21,SREG
brne label

label_2:
	sbrs r21,2
	rjmp label

main:
	rjmp main
