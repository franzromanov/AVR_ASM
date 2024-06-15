.equ DDRB_Reg, 0x24     ; DDRB register address
.equ PORTB_Reg, 0x25    ; PORTB register address
.equ LED_Bit, 5         ; Bit number for pin 13 (LED)

.global main
main:
    ldi r16, 1<<LED_Bit  ; Set bit corresponding to pin 13 as output (1)
    out DDRB_Reg, r16    ; Set pin 13 as output by writing to the DDRB register

    ldi r16, 1<<LED_Bit  ; Set bit corresponding to pin 13 high (turn on LED)
    out PORTB_Reg, r16   ; Write logic high to PORTB register to turn on the LED

loop:
    rjmp loop            ; Endless loop

