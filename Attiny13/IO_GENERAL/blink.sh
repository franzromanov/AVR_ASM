avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=16000000UL -o blink.elf blink.s 
avr-objcopy -O ihex -R .eeprom blink.elf blink.hex 
avrdude -c usbasp -p t13  -U flash:w:blink.hex
