org 0x7C00
bits 16

start:
    cli
    mov ax, 0 
    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00 
    sti

; позиция окраса итд
mov ah, 0x06
mov al, 0
mov bh, 0xF0
mov ch, 0
mov cl, 0
mov dh, 24
mov dl, 79
int 0x10

; терь курсор
mov ah, 0x02
mov bh, 0
mov dh, 0
mov dl, 0
int 0x10

mov si, message
print:
lodsb
cmp al, 0
je halt
mov ah, 0x0E
mov bl, 0xF0
int 0x10
jmp print

halt:
jmp halt


message db "KIRILLISAEV_OS", 0

times 510 - ($ - $$) db 0  
dw 0xAA55
