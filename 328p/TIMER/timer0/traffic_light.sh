avr-gcc -g -DF_CPU=16000000UL  -nostartfiles -mmcu=atmega328p -o traffic_light.elf traffic_light.s
avr-objcopy -O ihex -R .eeprom traffic_light.elf traffic_light.hex
#avra traffic_light.asm
avrdude -F -V -p m328p -c arduino -b 115200 -P /dev/ttyUSB* -U flash:w:traffic_light.hex
