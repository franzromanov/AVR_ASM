avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o fastpwm.elf fastpwm.s
avr-objcopy -O ihex -R .eeprom fastpwm.elf fastpwm.hex
avrdude -c arduino -p atmega328p -P /dev/ttyACM* -b 115200 -U flash:w:fastpwm.hex
