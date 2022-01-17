QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu nasm

helloos/helloos.bin : helloos/helloos.asm Makefile
	nasm helloos/helloos.asm -o helloos/helloos.bin -l helloos/helloos.txt

boot-helloos : helloos/helloos.asm helloos/helloos.bin Makefile
	$(QEMU) $(OPTION) file=helloos/helloos.bin,index=0,if=floppy,format=raw

hosonos/hosonos.bin : hosonos/hosonos.asm Makefile
	nasm hosonos/hosonos.asm -o hosonos/hosonos.bin -l hosonos/hosonos.txt

boot-hosonos : hosonos/hosonos.asm hosonos/hosonos.bin Makefile
	$(QEMU) $(OPTION) file=hosonos/hosonos.bin,index=0,if=floppy,format=raw
