.text
.org 0x0000
.equ ADMUX, 0x7C
.equ ADCSRA, 0x7A
.equ ADCL, 0x78
.equ ADCH, 0x79
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
init:
    cbi 0x04,0
    sbi 0x04,5

main:
    cbi 0x05,5 
    ldi r22,0
    call read_analog
    mov r20,r30
    mov r21,r31
    subi r20,60
    in r20,0x3F
    sbci r21,0
    in r21,0x3F
    and r20,r21
    sbrs r20,2
    inc r22

    in r16,0x03
    sbrc r16,0
    inc r22

    in r16,0x03
    sbrs r16,0
    dec r22

LAMP_OFF:
    cpi r22,2
    breq LAMP_ON
    cbi 0x05,5
    rjmp main
LAMP_ON:
    sbi 0x05,5
    call delay_init
    rjmp main


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

delay_init:

    ldi r17,15

delay:
    cpi r17,0
    breq return
    ldi r18,255
    dec r17    
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