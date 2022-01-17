QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu nasm

helloos/helloos.img :
	nasm helloos/helloos.asm -o helloos/helloos.img

boot-helloos : helloos/helloos.img
	$(QEMU) $(OPTION) file=helloos/helloos.img,index=0,if=floppy,format=raw

hosonos/hosonos.img :
	nasm hosonos/hosonos.asm -o hosonos/hosonos.img

boot-hosonos : hosonos/hosonos.img
	$(QEMU) $(OPTION) file=hosonos/hosonos.img,index=0,if=floppy,format=raw
