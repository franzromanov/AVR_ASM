#!/bin/bash
avr-gcc -g -nostartfiles -mmcu=atmega328p -o test.elf test.s
avr-objcopy -O ihex test.elf test.hex

