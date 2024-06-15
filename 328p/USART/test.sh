avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o test.elf test.s 
avr-objcopy -O ihex -R .eeprom test.elf test.hex 
#avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:test.hex
