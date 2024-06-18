avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o normal_mode.elf normal_mode.s 
avr-objcopy -O ihex -R .eeprom normal_mode.elf normal_mode.hex 
avrdude -c usbasp -p t13  -U flash:w:normal_mode.hex
