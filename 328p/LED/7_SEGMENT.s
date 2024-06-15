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
	ldi r16,0b11111100
	out 0x0A,r16
	ldi r16,(1<<0)
	out 0x04,r16
	cbi 0x04,5
	cbi 0x04,4
	sbi 0x05,5
	sbi 0x05,4
	ldi r19,0

main:



	in r20,0x03
	call delay_init
	sbrs r20,5
	dec r19
	in r20,0x3F
	sbrc r20,2
	clr r19
	call segment_def

	in r20,0x03
	call delay_init
	sbrs r20,4
	inc r19
	cpi r19,10
	in r20, 0x3F
	sbrc r20,1
	clr r19
	call segment_def
	call delay_init

	rjmp main


segment_def:
	ldi r17,0b11111100
	out 0x0B,r17
	sbi 0x05,0
	mov r16,r19
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
	ldi r16,0x0
	out 0x0B,r16
	;cbi 0x05,0
	ret
one:
	;---1
	cbi 0x0B,b
	cbi 0x0B,c
	ret
two:
	;---2
	ldi r16, (1<<a)|(1<<b)|(1<<d)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
three:
	;---3
	ldi r16, (1<<a)|(1<<b)|(1<<c)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
four:
	;---4
	cbi 0x0B,b
	cbi 0x0B,c
	cbi 0x0B,e
	cbi 0x05,g
	ret


five:
	;---5
	ldi r16, (1<<a)|(1<<c)|(1<<e)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
six:
	;---6
	ldi r16, (1<<a)|(1<<c)|(1<<d)|(1<<e)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
seven:
	;---7
	ldi r16, (1<<a)|(1<<b)|(1<<c)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	ret
eight:
	;---8
	ldi r16,  (1<<a)|(1<<b)|(1<<c)|(1<<d)|(1<<e)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret
nine:
	;---9
	ldi r16, (1<<a)|(1<<b)|(1<<c)|(1<<e)|(1<<f)
	com r16
	cbi 0x0B,0
	cbi 0x0B,1
	out 0x0B,r16
	cbi 0x05,g
	ret

;subroutine_delay
delay_init:
    ldi r16,0xf
    ldi r17,0x3
    ldi r24,0x3


delay:
    dec r24
    brne delay
    dec r25
    brne delay
    dec r16
    cp r17,r16
    brne delay
    ret