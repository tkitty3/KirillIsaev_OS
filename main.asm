bits 32

MAGIC       equ 0x1BADB002
FLAGS       equ 0x0
CHECKSUM    equ -(MAGIC + FLAGS)

section .multiboot
align 4
dd MAGIC
dd FLAGS
dd CHECKSUM

section .bss
align 16
stack_b:
resb 16384

stack_t:
section .text
global start
extern kmain
start:
mov esp, stack_t
call kmain
cli

.halt:
hlt
jmp .halt
