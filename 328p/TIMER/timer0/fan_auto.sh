avr-gcc -g -DF_CPU=16000000UL  -nostartfiles -mmcu=atmega328p -o fan_auto.elf fan_auto.s
avr-objcopy -O ihex -R .eeprom fan_auto.elf fan_auto.hex
#avra fan_auto.asm
avrdude -F -V -p m328p -c arduino -b 115200 -P /dev/ttyACM* -U flash:w:fan_auto.hex
