.equ DDRC, 0x24   ; Data Direction Register C
.equ DDRB, 0x17   ; Data Direction Register B
.equ PORTB, 0x18  ; Port B
.equ PINC, 0x26

start:
    inc r16
    ldi r17, 0xff
    ldi r18, 0x00
    out DDRC, r18
    out DDRB, r17
    out PORTB, r16
    in r19, PINC
    rjmp start

