day1-0 :
	qemu-system-i386 -L . -m 32 -rtc base=localtime -vga std -drive file=day01/helloos0.img,index=0,if=floppy,format=raw
