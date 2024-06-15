#!/bin/bash
avr-gcc -g -nostartfiles -mmcu=atmega328p -o test2.elf test2.s
avr-objcopy -O ihex test2.elf test2.hex
