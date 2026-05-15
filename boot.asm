org 0x7C00
bits 16
start:
cli
mov ax, 0
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7C00
sti
mov si, message
print:
lodsb
cmp al, 0
je halt
mov ah, 0x0E
int 0x10
jmp print


halt:
cli

.loop:
hlt 
jmp .loop




message: db "KIRILLISAEV_OS", 0
times 510 - ($ - $$) db 0 
dw 0xAA55
