avr-gcc -g -nostartfiles  -DF_CPU=16000000UL -mmcu=atmega328p -o 8bit_led.elf 8bit_led.s
avr-objcopy -O ihex -R .eeprom 8bit_led.elf 8bit_led.hex
avrdude -V -F -c arduino -p m328p -P /dev/ttyACM* -b 115200 -U flash:w:8bit_led.hex
