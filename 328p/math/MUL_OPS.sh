avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o MUL_OPS.elf MUL_OPS.s
avr-objcopy -O ihex -R .eeprom MUL_OPS.elf  MUL_OPS.hex