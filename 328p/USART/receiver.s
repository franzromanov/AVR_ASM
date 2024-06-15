.text
.org 0x000

uart_init:
	;enable_transmitter_receiver
	ldi r16, (1<<4)|(1<<3)
	out UCSR0B,r16
	;set_character_size
	ldi r16,0b110
	out UCSR0C,r16
	;set_baudrate
	ldi r16,8
	out UBRR0L,r16


main:
	call transceiver

	rjmp main

transceiver:
	sbis UCSR0A,7
	rjmp transceiver
	in r16,UDR0
transmit:
	sbis UCSR0A,5
	rjmp transmit
	out UDR0,r16
	ret





