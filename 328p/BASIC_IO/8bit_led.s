/*
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 *
 *
 * More on Github: https://github.com/franzromanov
 *
 * Author: moh.naufal Hizbullah
 * Institution: Institut Teknologi Kalimantan
 *
 */

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
.equ PIND,0x09
.equ DDRC,0x07
.equ PINC,0x06
.equ PORTC,0x08

setup_button:
    cbi DDRC,0
    cbi DDRC,1
    sbi PORTC,0
    sbi PORTC,1


store_int_arr:
    ; Load the address of int_arr into Z register pair
    ldi r30,lo8(int_arr)
    ldi r31,hi8(int_arr)

    ; Store values into int_arr using std
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
    ldi r18,4
    std Z+6,r18
    ldi r18,5
    std Z+7,r18

    ; Initialize registers for calculation
    ldi r16,0x08
    ldi r19,0x00
    
calc:
    ; Load data from memory pointed by Z
    ld r0,Z
    inc r30
    mov r17,r0
    add r19,r17
    dec r16

    ; Check if calculation is finished
    cpi r16,0x0
    brne calc

    ; Move the calculated value to r18
    mov r18,r19
    ; Reset registers for next iteration
    ldi r19,0
    ldi r17,0

main:
    ; Call button logic functions
    call button_logic_1
    call button_logic_2

    ; Output values to DDRB, PORTB, DDRD, and PORTD
    out DDRB,r17
    out PORTB,r17
    out DDRD,r19
    out PORTD,r19

    ; Clear registers for next iteration
    clr r17
    clr r19
    out DDRB,r17
    out PORTB,r17
    out DDRD,r19
    ldi r19,(1<<2)|(1<<3)
    out PORTD,r19

    ; Loop indefinitely
    rjmp main

; Subroutines

button_logic_1:
    mov r19,r18
    sbis PINC,0
    call init_shift
    ret

button_logic_2:
    sbis PINC,1
    call complement
    ret

complement:
    mov r19,r18
    com r19
    call init_shift
    ret

init_shift:
    ldi r22,0
    out PORTB,r22
    out PORTD,r22
    cbi PORTD,7
    cbi PORTD,6
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
    ret
