;normal_mode

.equ TCCR0B,0x25
.equ TCCR0A,0x24


SET_TIMER:
	ldi r16, 0x00
	out TCCR0A,r16
	out TCCR0B,r16
	sbi TCCR0B,2
	sbi TCCR0B,0
	