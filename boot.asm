global _start
section .text
_start:
mov al, 255
mov bl, 1
add al, bl

mov rcx, 2

mov rdx, 4

cmovnc rdi, rcx
cmovc rdi, rdx

mov rax, 60
syscall