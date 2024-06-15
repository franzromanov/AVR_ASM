avr-gcc -g -nostartfiles -mmcu=atmega328p -o led_pb.elf led_pb.s
avr-objcopy -O ihex led_pb.elf led_pb.hex
avrdude -c arduino -p m328p -P /dev/ttyACM0 -U flash:w:led_pb.hex

