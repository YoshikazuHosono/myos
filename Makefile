QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu nasm
day1 :
	nasm day01/helloos.asm -o day01/helloos.img
	$(QEMU) $(OPTION) file=day01/helloos.img,index=0,if=floppy,format=raw
hosono :
	nasm hosonos/hosonos.asm -o hosonos/hosonos.img
	$(QEMU) $(OPTION) file=hosonos/hosonos.img,index=0,if=floppy,format=raw
