avr-gcc -g -nostartfiles -mmcu=atmega328p -o metal_detect.elf metal_detect.s 
avr-objcopy -O ihex -R .eeprom metal_detect.elf metal_detect.hex 
avrdude -c arduino -p m328p -P /dev/ttyUSB* -b 115200 -U flash:w:metal_detect.hex