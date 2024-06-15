avr-gcc -g -nostartfiles -mmcu=atmega328p -o 7_SEGMENT.elf 7_SEGMENT.s 
avr-objcopy -O ihex -R .eeprom 7_SEGMENT.elf 7_SEGMENT.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:7_SEGMENT.hex