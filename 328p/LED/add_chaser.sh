avr-gcc -g -nostartfiles  -DF_CPU=16000000UL -mmcu=atmega328p -o add_chaser.elf add_chaser.s
avr-objcopy -O ihex -R .eeprom add_chaser.elf add_chaser.hex
avrdude -V -F -c arduino -p m328p -P /dev/ttyACM* -b 115200 -U flash:w:add_chaser.hex
