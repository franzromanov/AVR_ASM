avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o fire_detect.elf fire_detect.s 
avr-objcopy -O ihex -R .eeprom fire_detect.elf fire_detect.hex 
avrdude -c usbasp -p t13  -U flash:w:fire_detect.hex
