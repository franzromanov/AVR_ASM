avr-gcc -g -nostartfiles -mmcu=attiny13 -DF_CPU=128000UL -o plant_manager.elf plant_manager.s 
avr-objcopy -O ihex -R .eeprom plant_manager.elf plant_manager.hex 
avrdude -c usbasp -p t13  -U flash:w:plant_manager.hex
