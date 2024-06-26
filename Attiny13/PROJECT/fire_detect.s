.org 0x000
.text
;r16 as return val
;r17 to count condition
;true  0b00000001
;false 0b00000000
;adc3-fire-sensing-PB3
;adc2-smoke-sensing-PB4

init:
	sbi 0x17,1 	;buzzer
	sbi 0x17,2 	;water_pump_switch
	sbi 0x17,0 	;LED_INDICATOR
main:
	;init--
	clr r16
	clr r17
	rcall sense_1
	sbrc r16,0
	inc r17
	cln

	clr r16 	;intermediate

	rcall sense_2
	sbrc r16,0
	inc r17
	cln

	cpi r17,2
	breq system_on
	ldi r16,0
	out 0x3F,r16 ;---clear_SREG
	rjmp main ;-----loopback

;---------------------subroutine
system_on:
	sbi 0x18,1 	;turn_on_buzz
	sbi 0x18,2 	;turn_on_water_pump
	sbi 0x18,0 	;turn_on_LED

	rcall delay
	clr r16
	out 0x18,r16
	rjmp main

delay:	;-----15_sec
	;----counting_register
	ldi r18,0b01001011
	ldi r19,101
delay_init:
	ldi r16,0b11;TCCR0A
	out 0x2F,r16
	ldi r16,0b101;TCCR0B
	out 0x33,r16
	ldi r16, 0xFF;0CR0A
	out 0x36,r16
	rjmp cnt_process
flag_reset:
	ldi r16,0b10
	out 0x38,r16
cnt_process:
	in r16,0x38
	sbrs r16,2
	rjmp cnt_process
	cpi r18,0
	breq higher_cnt
lower_cnt:
	dec r18
	brne higher_cnt
	rjmp flag_reset
higher_cnt:
	dec r19
	brne stop_timer
	rjmp flag_reset
stop_timer:
	clr r18
	clr r19
	out 0x36,r18
	out 0x33,r18
	out 0x2F,r18
	ret

;---------------------ANALOG---CONVERTING

sense_1:
	ldi r18, 250;buffer_val
init_1:
	ldi r20,0b11 ;ADMUX
	out 0x07,r20
	ldi r20,(0b111)|(1<<7)|(1<<6) ;ADCSRA
	out 0x06,r20
converting_1:
	in r20,0x06
	sbrs r20,4
	rjmp converting_1

comparing_1:

	in r20,0x04	;ADCL
	in r21,0x05	;ADCH
	cpi r21,0
	breq higher_1
	subi r20,255
	in r20,0x3F
	sbrc r20,2
	rjmp higher_1
	
lower_or_equal_1:
	ldi r16,0
	ret
higher_1:
	ldi r16,1
	ret
 ;---------------------------------------------------------

sense_2:
	ldi r18, 250;buffer_val
init_2:
	ldi r20,0b10 ;ADMUX
	out 0x07,r20
	ldi r20,(0b111)|(1<<7)|(1<<6) ;ADCSRA
	out 0x06,r20
converting_2:
	in r20,0x06
	sbrs r20,4
	rjmp converting_2

comparing_2:

	in r20,0x04	;ADCL
	in r21,0x05	;ADCH
	cpi r21,0
	breq higher_2
	subi r20,255
	in r20,0x3F
	sbrc r20,2
	rjmp higher_2
	
lower_or_equal_2:
	ldi r16,0
	ret
higher_2:
	ldi r16,1
	ret
