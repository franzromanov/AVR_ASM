avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o uart_str.elf uart_str.s 
avr-objcopy -O ihex -R .eeprom uart_str.elf uart_str.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:uart_str.hex