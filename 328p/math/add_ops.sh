#for debugging-using avr-gdb & simavr, add param -g on avr-gcc

avr-gcc -g -nostartfiles -mmcu=atmega328p -o add_ops.elf add_ops.s
avr-objcopy -O ihex -R .eeprom add_ops.elf add_ops.hex
#avrdude -F -V  -c arduino -p m328p -P /dev/ttyACM* -U flash:w:add_ops.hex
