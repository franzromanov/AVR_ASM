avr-gcc -g -nostartfiles -mmcu=atmega328p -o LED_ON.elf LED_ON.s
avr-objcopy -O ihex -R .eeprom LED_ON.elf LED_ON.hex
avrdude -F -V -c arduino -p m328p -P /dev/ttyUSB* -U flash:w:LED_ON.hex
