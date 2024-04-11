;uart_str_
.data
.org 0x0103
morning:
	.byte 0,1,2,3,4,5,6,7,8,9,10,11,12 ;str

.text
.org 0x0000

;------define_Peripherals
.equ UBRR0H,0xC5
.equ UBRR0L,0xC4
.equ UCSR0C,0xC2
.equ UCSR0B,0xC1
.equ UCSR0A,0xC0
.equ UDR0,0xC6

STRING_ADDR:
	ldi r30,lo8(morning)
	ldi r31,hi8(morning)
STORE_ARR:
	; Store values into int_arr using std
    ldi r18,'H'
    st Z,r18
    ldi r18,'E'
    std Z+1,r18
    ldi r18,'L'
    std Z+2,r18
    ldi r18,'L'
    std Z+3,r18
    ldi r18,'O'
    std Z+4,r18
    ldi r18,' '
    std Z+5,r18
    ldi r18,'W'
    std Z+6,r18
    ldi r18,'O'
    std Z+7,r18
    ldi r18,'R'
    std Z+8,r18
    ldi r18,'L'
    std Z+9,r18
    ldi r18,'D'
    std Z+10,r18
    ldi r18,'\n'
    std Z+11,r18
    ldi r18,0x00
    std Z+12,r18

INIT_UART:
	;set_baud---clk=16MHz==>103[9600]
	ldi r16,(8>>8)
	sts UBRR0H,r16
	ldi r16,8
	sts UBRR0L,r16

	;enable t&r
	ldi r16,(1<<3)|(1<<4)
	sts UCSR0B,r16

	;data_frame
	ldi r16,(1<<1)|(1<<2)
	sts UCSR0C,r16

main:
	call transmit_str
	call delay
	rjmp main

;-------subroutine
;-----------------[1]
transmit_str:
	ld r17,Z
	call transmit
	inc r30
	ld r17,Z
	cpi r17,0x00
	brne transmit_str
	subi r30,12
	ret

transmit:
	mov r16,r17
sub_1:
	lds r17,UCSR0A
	sbrs r17,5
	rjmp sub_1
	sts UDR0,r16
	ret
;-----------------[2]
delay:
    ldi r16,0x0F
    ldi r24,0x0F
    ldi r25,0x0F

sub_delay:
    dec r24
    brne sub_delay
    dec r25
    brne sub_delay
    dec r16
    brne sub_delay
    ret






