#!/bin/bash
set -e

#компиляция
nasm -f elf32 boot.asm -o loader.o
gcc -m32 -ffreestanding -c kernel.c -o kernel.o
ld -m elf_i386 --no-warn-rwx-segments -T link.ld -o kernel.bin loader.o kernel.o

#делаем груб
mkdir -p isodir/boot/grub
cat << 'EOF' > isodir/boot/grub/grub.cfg
menuentry "KirillIsaevOS" {
    multiboot /boot/kernel
}
EOF

#исо файл
cp kernel.bin isodir/boot/kernel
grub-mkrescue -d /usr/lib/grub/i386-pc/ -o kirillisaevos.iso isodir
