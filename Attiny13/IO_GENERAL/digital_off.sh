avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=16000000UL -o digital_off.elf digital_off.s 
avr-objcopy -O ihex -R .eeprom digital_off.elf digital_off.hex 
avrdude -c usbasp -p t13  -U flash:w:digital_off.hex
