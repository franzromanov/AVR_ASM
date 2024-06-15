.text
.org 0x000

uart_init:
	;enable_transmitter_receiver
	ldi r16, (1<<4)|(1<<3)
	sts 0xC1,r16
	;set_character_size
	ldi r16,0b110
	sts 0xC2,r16
	;set_baudrate
	ldi r16,8
	sts 0xC4,r16

main:
	call transceiver
	rjmp main

transceiver:
	lds r16,0xC0
	sbrs r16,7
	rjmp transceiver
	lds r16,0xC6
	
transmit:
	lds r17,0xC0
	sbrs r17,5
	rjmp transmit
	sts 0xC6,r16
	ret





