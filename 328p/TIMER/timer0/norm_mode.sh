avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o norm_mode.elf norm_mode.s
avr-objcopy -O ihex -R .eeprom norm_mode.elf norm_mode.hex
avrdude -c arduino -p atmega328p -P /dev/ttyACM* -b 115200 -U flash:w:norm_mode.hex
