#!/bin/bash
avr-gcc -g -nostartfiles -mmcu=atmega328p -o test3.elf test3.s
avr-objcopy -O ihex test3.elf test3.hex
