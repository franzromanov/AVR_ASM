;soil_sensor:pb3/adc3
;humidity_sensor:pb4/adc2
;water_pump:pb2
;humidifier:pb1
;r16-for_return_value

main:

	session_1:
		rcall moisture_reading
		sbrc r16,1
		rcall pump_on 
	
	clr r16

	session_2:
		rcall humidity_reading
		sbrc r16,1
		rcall humidifier_on

	clr r16

	rjmp main

;sub-routine-----------------

pump_on:
	sbi 0x17,2
	sbi 0x18,2
	rcall delay
	cbi 0x17,2
	cbi 0x18,2
	ret

humidifier_on:
	sbi 0x17,1
	sbi	0x18,1
	rcall delay
	cbi 0x17,1
	cbi 0x18,1
	ret

;5-seconds_delay
delay:
	ldi r17,0b01101001
	ldi r18,0b10

	init:
		ldi r16,0b10
		out 0x2F,r16 	;TCCR0A
		ldi r16,0b101
		out 0x33,r16 	;TCCR0B
	load:
		ldi r16,255
		out 0x36,r16 	;OCR0A
		ldi r16,0b10
		out 0x38,r16 	;TIFR0
	pre_state:
		in r16,0x38
		sbrs r16,1
		rjmp pre_state
		cpi r17,0
		breq dec_high
	dec_low:
		dec r17
		cpi r17,0
		brne load
	dec_high:
		dec r18
		cpi r18,0
		brne load
	reclamation:
		clr r16
		clr r17
		clr r18
		out 0x38,r16
		out 0x36,r16
		out 0x33,r16
		out 0x2F,r16
		clz
	exit:
		ret

moisture_reading:
	ldi r17,	;LOW_comp
	ldi r18,	;HIGH_comp
	ldi r19,0b11
	out 0x07,r19 	;ADMUX
	ldi r19,(0b111)|(3<<6)
	out 0x06,r19 	;ADCSRA
	converting:
		in r19,0x06
		sbrs r19,4
		rjmp converting
		in r20,0x04
		in r21,0x05
	reclamation_moist:
		clr r19
		out 0x07,r19
		out 0x06,r19
	compare_low:

	compare_high:

		cpi r16,2
		breq true
		rjmp false
	true:
		ldi r16,1
		ret
	false:
		clr r16
		ret
	
humidity_reading:
	ldi r17,	;LOW_comp
	ldi r18,	;HIGH_comp
	ldi r19,0b10
	out 0x07,r19 	;ADMUX
	ldi r19,(0b111)|(3<<6)
	out 0x06,r19 	;ADCSRA
	converting_:
		in r19,0x06
		sbrs r19,4
		rjmp converting_
		in r20,0x04
		in r21,0x05
	reclamation_hum:
		clr r19
		out 0x07,r19
		out 0x06,r19
	compare_low_:

	compare_high_:

		cpi r16,2
		breq true_
		rjmp false_
	true_:
		ldi r16,1
		ret
	false_:
		clr r16
		ret