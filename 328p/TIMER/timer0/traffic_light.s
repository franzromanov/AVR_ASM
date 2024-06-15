.text
.org 0x000
.equ a,2
.equ b,3
.equ c,4
.equ d,5
.equ e,6
.equ f,7
.equ g,0

init:
	ldi r16,(1<<5)|(1<<4)|(1<<3)|(1<<0)
	out 0x04,r16
	ldi r16,0b11111100
	out 0x0A,r16

main:
	ldi r16,(1<<5)|(0<<4)|(0<<3)
	out 0x05,r16
	ldi r17,9
	call delay
	ldi r16,(1<<5)|(1<<4)|(0<<3)
	out 0x05,r16
	ldi r17,2
	call delay
	ldi r16,(0<<5)|(0<<4)|(1<<3)
	out 0x05,r16
	ldi r17,9
	call delay
	ldi r16,(0<<5)|(1<<4)|(1<<3)
	out 0x05,r16
	ldi r17,2
	call delay
	rjmp main

delay:
	cpi r17,0
	breq return
	ldi r18,255
	dec r17
	call segment_def
	
main_delay:
	ldi r16,0
	out 0x24,r16
	ldi r16,(1<<1)
	out 0x24,r16
;---------------------------
	ldi r16,(1<<2)|(1<<0)
	out 0x25,r16
	ldi r16,156
	out 0x27,r16

check_interrupt:

	in r16,0x15
	sbrs r16,1
	rjmp check_interrupt
	sbi 0x15,1
	dec r18
	breq delay
	rjmp main_delay
return:
	ret

segment_def:
	ldi r20,0b00000000
	out 0x0B,r20
	cbi 0x05,0
	mov r16,r17
	;----condition
	cpi r16,0
	breq zero
	cpi r16,1
	breq one
	cpi r16,2
	breq two
	cpi r16,3
	breq three
	cpi r16,4
	breq four
	cpi r16,5
	breq five
	cpi r16,6
	breq six
	cpi r16,7
	breq seven
	cpi r16,8
	breq eight
	cpi r16,9
	breq nine

zero:
	;---0[A,B,C,D,E,F]
	ldi r16,0b01111100
	out 0x0B,r16
	sbi 0x05,0
	ret
one:
	;---1
	sbi 0x0B,b
	sbi 0x0B,c
	ret
two:
	;---2
	ldi r16, (1<<a)|(1<<b)|(1<<d)|(1<<e)|(1<<f)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
three:
	;---3
	ldi r16, (1<<a)|(1<<b)|(1<<f)|(1<<c)|(1<<d)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
four:
	;---4
	sbi 0x0B,b
	sbi 0x0B,c
	sbi 0x0B,f
	sbi 0x05,0
	ret
five:
	;---5
	ldi r16, (1<<a)|(1<<c)|(1<<d)|(1<<f)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	sbi 0x05,g
	ret
six:
	;---6
	ldi r16, (1<<a)|(1<<c)|(1<<d)|(1<<e)|(1<<f)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	sbi 0x05,g
	ret
seven:
	;---7
	ldi r16, (1<<a)|(1<<b)|(1<<c)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	ret
eight:
	;---8
	ldi r16,  (1<<a)|(1<<b)|(1<<c)|(1<<d)|(1<<e)|(1<<f)
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	sbi 0x05,g
	ret
nine:
	;---9
	ldi r16, (1<<a)|(1<<b)|(1<<c)|(1<<d)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	sbi 0x05,g
	ret
