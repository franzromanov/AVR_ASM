avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o uart_int.elf uart_int.s 
avr-objcopy -O ihex -R .eeprom uart_int.elf uart_int.hex 
avrdude -c usbasp -p m328p  -U flash:w:uart_int.hex
