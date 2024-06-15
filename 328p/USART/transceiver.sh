avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o transceiver.elf transceiver.s 
avr-objcopy -O ihex -R .eeprom transceiver.elf transceiver.hex 
avrdude -c arduino -P /dev/ttyACM* -b 115200 -p m328p  -U flash:w:transceiver.hex
