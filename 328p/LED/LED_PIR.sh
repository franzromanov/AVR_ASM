avr-gcc -g -nostartfiles -mmcu=atmega328p -o LED_PIR.elf LED_PIR.s 
avr-objcopy -O ihex -R .eeprom LED_PIR.elf LED_PIR.hex 
avrdude -c usbasp -p m328p  -U flash:w:LED_PIR.hex