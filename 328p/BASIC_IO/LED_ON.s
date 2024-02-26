;define port
.equ DDRB, 0x04
.equ PORTB, 0x05

main:
        ldi r16,1<<5
        ldi r17,1<<5
        out DDRB, r17 ;toggleDDRB
        out PORTB, r16 ;togglePORTB
loop:
        rjmp main ;looping
