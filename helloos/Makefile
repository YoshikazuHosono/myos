QEMU ?= qemu-system-i386
OPTION ?=  -L . -m 32 -rtc base=localtime -vga std -drive 

ipl.bin : ipl.asm Makefile
	nasm ipl.asm -o ipl.bin -l ipl.txt

haribote.sys : haribote.asm Makefile
	nasm haribote.asm -o haribote.sys -l haribote.txt

haribote.img : ipl.bin haribote.sys Makefile
	mformat -f 1440 -C -B ipl.bin -i haribote.img ::
	mcopy -i haribote.img haribote.sys ::

run :
	make haribote.img
	$(QEMU) $(OPTION) file=haribote.img,index=0,if=floppy,format=raw
