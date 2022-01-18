QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

hosonos.bin : hosonos.asm Makefile
	nasm hosonos.asm -o hosonos.bin -l hosonos.txt

run :
	make hosonos.bin
	$(QEMU) $(OPTION) file=hosonos.bin,index=0,if=floppy,format=raw
