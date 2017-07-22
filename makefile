#all: hello.exe

#hello.exe: hello.o
#	 gcc -o hello.exe hello.o

kernel.bin: start.o gdt.o idt.o isrs.o irq.o scrn.o main.o
	ld -m elf_i386 -T link.ld -o kernel.bin start.o gdt.o idt.o isrs.o irq.o scrn.o main.o 

start.o: start.asm
	 nasm -f elf -o start.o start.asm

scrn.o: scrn.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o scrn.o scrn.c

gdt.o:gdt.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o gdt.o gdt.c

idt.o:idt.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o idt.o idt.c

isrs.o:isrs.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o isrs.o isrs.c

irq.o:irq.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o irq.o irq.c

main.o: main.c
	gcc -m32 -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o main.o main.c
     
clean:
	 rm start.o gdt.o idt.o isrs.o irq.o scrn.o main.o kernel.bin
