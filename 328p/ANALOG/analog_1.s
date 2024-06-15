.equ ADMUX, 0x7C
.equ ADCSRA, 0x7A
.equ ADCL, 0x78
.equ ADCH, 0x79
.equ PORTB, 0x05
.equ DDRB, 0x04

init_analog:
    ldi r16, (1<<6)
    sts ADMUX, r16
    ldi r16, 0x07 | (1<<7)
    sts ADCSRA, r16
    
main:
	sbi DDRB,5
    call read_analog
    cpse r29, 0x03
    cbi PORTB, 5
    cpi r28, 0xFF
    rjmp main
    sbi PORTB, 5
    rjmp main

read_analog:
    lds r16, ADCSRA
    ori r16, (1<<6)
    sts ADCSRA, r16
    ldi r16, 8
wait:
    lds r17, ADCSRA
    SBRC r17, 6
    brne wait
conversion_lo:
    lds r28, ADCL
conversion_hi:
    lds r29, ADCH
shift:
    lsl r29
    dec r16
    brne shift
    ret
    