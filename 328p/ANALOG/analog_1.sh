avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o analog_1.elf analog_1.s 
avr-objcopy -O ihex -R .eeprom analog_1.elf analog_1.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:analog_1.hex