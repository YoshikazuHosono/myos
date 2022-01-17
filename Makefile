QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu nasm

helloos/helloos.img :
	nasm helloos/helloos.asm -o helloos/helloos.img

boot-helloos : helloos/helloos.img
	$(QEMU) $(OPTION) file=helloos/helloos.img,index=0,if=floppy,format=raw

hosonos/hosonos.bin : hosonos/hosonos.asm Makefile
	nasm hosonos/hosonos.asm -o hosonos/hosonos.bin -l hosonos/hosonos.txt

boot-hosonos : hosonos/hosonos.asm hosonos/hosonos.bin Makefile
	$(QEMU) $(OPTION) file=hosonos/hosonos.bin,index=0,if=floppy,format=raw
