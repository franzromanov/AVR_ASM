avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o uart_int.elf uart_int.s 
avr-objcopy -O ihex -R .eeprom uart_int.elf uart_int.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:uart_int.hex
