avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o pwm_mode.elf pwm_mode.s 
avr-objcopy -O ihex -R .eeprom pwm_mode.elf pwm_mode.hex 
avrdude -c usbasp -p t13  -U flash:w:pwm_mode.hex
