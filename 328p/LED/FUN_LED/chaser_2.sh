avr-gcc -g -nostartfiles -mmcu=atmega328p -o chaser_2.elf chaser_2.s 
avr-objcopy -O ihex -R .eeprom chaser_2.elf chaser_2.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:chaser_2.hex