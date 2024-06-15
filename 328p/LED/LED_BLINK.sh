avr-gcc -g -DF_CPU=16000000UL  -nostartfiles -mmcu=atmega328p -o LED_BLINK.elf LED_BLINK.s
avr-objcopy -O ihex -R .eeprom LED_BLINK.elf LED_BLINK.hex
#avra LED_BLINK.asm
avrdude -F -V -p m328p -c usbasp   -U flash:w:LED_BLINK.hex
