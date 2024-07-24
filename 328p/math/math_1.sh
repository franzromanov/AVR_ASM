avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o math_1.elf math_1.s
avr-objcopy -O ihex -R .eeprom math_1.elf math_1.hex



