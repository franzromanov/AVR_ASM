avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=16000000UL -o digital_on.elf digital_on.s 
avr-objcopy -O ihex -R .eeprom digital_on.elf digital_on.hex 
avrdude -c usbasp -p t13  -U flash:w:digital_on.hex
