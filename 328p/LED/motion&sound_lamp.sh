avr-gcc -g -DF_CPU=16000000UL  -nostartfiles -mmcu=atmega328p -o "motion&sound_lamp.elf" "motion&sound_lamp.s"
avr-objcopy -O ihex -R .eeprom "motion&sound_lamp.elf" "motion&sound_lamp.hex"
avrdude -F -V -p m328p -c usbasp   -U flash:w:"motion&sound_lamp.hex"

