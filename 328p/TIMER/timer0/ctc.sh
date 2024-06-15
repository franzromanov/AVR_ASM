avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o ctc.elf ctc.s
avr-objcopy -O ihex -R .eeprom ctc.elf ctc.hex
avrdude -c arduino -p atmega328p -P /dev/ttyACM* -b 115200 -U flash:w:ctc.hex
