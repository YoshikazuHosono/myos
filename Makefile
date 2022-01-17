QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu nasm
day1 :
	nasm day01/helloos.nas -o day01/helloos.img
	$(QEMU) $(OPTION) file=day01/helloos.img,index=0,if=floppy,format=raw
hosonos :
	$(QEMU) $(OPTION) file=hosonos.img,index=0,if=floppy,format=raw
