avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o uart_str.elf uart_str.s 
avr-objcopy -O ihex -R .eeprom uart_str.elf uart_str.hex 
avrdude -c usbasp -p m328p  -U flash:w:uart_str.hex
