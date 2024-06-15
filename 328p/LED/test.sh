avr-gcc -g -nostartfiles -mmcu=atmega328p -o test.elf test.s
avr-objcopy -O ihex -R .eeprom test.elf test.hex
avrdude -V -F -c arduino -p m328p -P /dev/ttyACM* -b 115200 -U flash:w:test.hex
