avr-gcc -g -nostartfiles -mmcu=atmega328p -o sub_ops.elf sub_ops.s
avr-objcopy -O ihex -R .eeprom sub_ops.elf sub_ops.hex
#avrdude -c  arduino -p m328p -P /dev/ttyACM* -U flash:w:sub_ops.hex