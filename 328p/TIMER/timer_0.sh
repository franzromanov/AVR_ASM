#!/bin/bash
avr-gcc -g -nostartfiles -mmcu=atmega328p -DF_CPU=16000000UL -o timer_0.elf timer_0.s
avr-objcopy -O ihex -R .eeprom timer_0.elf timer_0.hex
avrdude -c arduino -p atmega328p -P /dev/ttyACM* -b 115200 -U flash:w:timer_0.hex
