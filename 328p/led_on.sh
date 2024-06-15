#!/bin/bash
avr-gcc -g -nostartfiles -mmcu=atmega328p -o led_on.elf led_on.s
avr-objcopy -O ihex led_on.elf led_on.hex
