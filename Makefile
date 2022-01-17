QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

init :
	brew install qemu
day1-0 :
	$(QEMU) $(OPTION) file=day01/helloos0.img,index=0,if=floppy,format=raw
hosonos :
	$(QEMU) $(OPTION) file=hosonos.img,index=0,if=floppy,format=raw
