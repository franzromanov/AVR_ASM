start:
ldi r16, 0x2f
ldi r17, 0x1
add r16,r17
mov r17,r18
sub r16,r18
inc r19
com r20

lds r16, 0x00
sts 0x00,r17

in r21, 0x01
out 0x3e, r21

rjmp start

