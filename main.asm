org 0x7C00
bits 16

start:
cli
mov ax, 0 ; системная хрень для зануления
mov ds, ax
mov es, ax
mov ss, ax
mov sp, 0x7C00 ; адрес из 1 строки (кто вообще будет этр читать)
sti

mov ah, 0x06 ;очистка экрана от надписей биоса шоб был только кирюша
mov al, 0
mov bh, 0xF0
mov ch, 0
mov cl, 0
mov dh, 24
mov dl, 79
int 0x10

mov ah, 0x02 ; зовем системных переключить курсор а то вдруг ну на всякий пожарный
mov bh, 0
mov dh, 0
mov dl, 0
int 0x10


mov si, message ; печать наконецто


print: ;ф-ия печати 
lodsb
cmp al, 0
je halt
mov ah, 0x0E
mov bl, 0xF0
int 0x10
jmp print


halt:
cli
jmp .loop

.loop:
hlt 
jmp .loop

message: db "KIRILLISAEV_OS", 0 ;когда кирилл и исаев
times 510 - ($ - $$) db 0  ;зануление остатка на 510байт
dw 0xAA55
