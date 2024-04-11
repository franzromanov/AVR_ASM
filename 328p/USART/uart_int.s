/*
 10-bit analog reading-to-serial
			   or
16-bit integer to serial display
*/
.text
.org 0x0000
.equ ADMUX, 0x7C
.equ ADCSRA, 0x7A
.equ ADCL, 0x78
.equ ADCH, 0x79
.equ PORTB, 0x05
.equ DDRB, 0x04
.equ UBRR0H, 0xC5
.equ UBRR0L, 0xC4
.equ UCSR0C, 0xC2
.equ UCSR0B, 0xC1
.equ UCSR0A, 0xC0
.equ UDR0, 0xC6
.equ SREG, 0x3F

init_analog:
	ldi r16,(1<<6)
	sts ADMUX,r16
	ldi r16,0x07|(1<<7)
	sts ADCSRA,r16
init_uart:
	clr r16
	sts UBRR0H,r16
	ldi r16,8
	sts UBRR0L,r16
	ldi r16,(1<<3)|(1<<4)
	sts UCSR0B,r16
	ldi r16,(1<<2)|(1<<1)
	sts UCSR0C,r16

main:
	call read_analog
	;ldi r30,0b11010010
	;ldi r31,0b100
	call convert
	call transmit
	rjmp main
;-----------------------------subroutine
read_analog:
	lds r16,ADCSRA
	ori r16,(1<<6)
	sts ADCSRA,r16
wait_conversion:
	lds r16,ADCSRA
	andi r16,1<<6
	cpi r16,0x00
	brne wait_conversion
load:
	lds r30,ADCL;lower_byte
	lds r31,ADCH;higher_byte
	ret
convert:
	clr r17
	clr r18
	clr r19
	clr r20
thousand:
	ldi r28,0b11101000
	ldi r29,0b11
sub_thousand:
	inc r17
	cpi r31,0x00
	breq ret_thousand_2
	;----check_done
	sub r30,r28
	sbci r31,0x00
	sub r31,r29
	brmi ret_thousand_1
	rjmp sub_thousand
ret_thousand_1:
	add r30,r28
	adc r31,r29
ret_thousand_2:
	cln
	clz
	clv	
	dec r17
hundred:
	ldi r28,100
sub_hundred:
	inc r18
	cpi r31,0x00
	in r21,SREG
	sub r30,r28
	sbci r31,0x00
	in r22,SREG
	or r21,r22
	andi r21,(1<<2)|(1<<1)
	sbrc r21,1
	sbrs r21,2
	rjmp sub_hundred
ret_hundred:
	dec r18
	ldi r21,0x00
	add r30,r28
	adc r31,r21
	cln
	clz
	clv
ten:
	clr r28
	clr r29
ten_2:
	inc r19
	subi r30,10
	brmi ret_ten
	rjmp ten_2
ret_ten:
	ldi r21,10
	add r30,r21
	dec r19
	cln
	clv
	clc
one:
	inc r20
	dec r30
	brne one
ret_one:
	clc
	cln
	clz
	ret

transmit:
	lds r16,UCSR0A
	SBRS r16,5
	rjmp transmit
	ldi r16,48
	add r17,r16
	sts UDR0,r17
section_2:
	lds r16,UCSR0A
	SBRS r16,5
	rjmp section_2
	ldi r16,48
	add r18,r16
	sts UDR0,r18
section_3:
	lds r16,UCSR0A
	SBRS r16,5
	rjmp section_3
	ldi r16,48
	add r19,r16
	sts UDR0,r19
section_4:
	lds r16,UCSR0A
	SBRS r16,5
	rjmp section_4
	ldi r16,48
	add r20,r16
	sts UDR0,r20
newline:
	lds r16,UCSR0A
	SBRS r16,5
	rjmp newline
	ldi r21,'\n'
	sts UDR0,r21
	ret
