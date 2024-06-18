avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o ctc_mode.elf ctc_mode.s 
avr-objcopy -O ihex -R .eeprom ctc_mode.elf ctc_mode.hex 
avrdude -c usbasp -p t13  -U flash:w:ctc_mode.hex
