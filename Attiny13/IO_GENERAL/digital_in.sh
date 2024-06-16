avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o digital_in.elf digital_in.s 
avr-objcopy -O ihex -R .eeprom digital_in.elf digital_in.hex 
avrdude -c usbasp -p t13  -U flash:w:digital_in.hex
