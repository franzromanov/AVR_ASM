
.data

.org 0x0303
int_arr:
    .byte 0,1,2,3,4,5,6,7

.text
.org 0x000
.equ PORTB,0x05
.equ DDRB,0x04
.equ DDRD,0x0A
.equ SREG,0x3F
.equ PORTD,0x0B

store_int_arr:
    ;load_address
    ldi r30,lo8(int_arr)
    ldi r31,hi8(int_arr)
    movw Z, r30

    ldi r18,0
    st Z,r18

    ldi r18,4
    std Z+1,r18

    ldi r18,2
    std Z+2,r18

    ldi r18,1
    std Z+3,r18

    ldi r18,1
    std Z+4,r18

    ldi r18,0
    std Z+5,r18

    ldi r18,2
    std Z+6,r18

    ldi r18,0
    std Z+7,r18

    ldi r16,0x07
    ldi r19,0x00
    
init_calc:
    ld r0,Z
    mov r17,r0
    add r19,r17

calc:
    inc r30
    ld r0,Z
    mov r17,r0
    add r19,r17
    dec r16

    cpi r16,0x0
    brne calc

init_shift:
    mov r17,r19
    ldi r16,0x02

loop_1:
    lsr r17
    dec r16
    brne loop_1
    ldi r16,0x06
loop_2:
    lsl r19
    dec r16
    brne loop_2


button_condition_1:


on:
    ;ld r19,Z
    ;mov r16,r30

    out DDRB,r17
    out PORTB,r17
    out DDRD,r19
    out PORTD,r19
    rjmp on