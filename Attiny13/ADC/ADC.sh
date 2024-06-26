avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o ADC.elf ADC.s 
avr-objcopy -O ihex -R .eeprom ADC.elf ADC.hex 
avrdude -c usbasp -p t13  -U flash:w:ADC.hex
