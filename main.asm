org 0x7C00           
bits 16              

start:
    xor ax, ax
    mov ds, ax
    mov es, ax  
   
    int 0x10        
mov si, hello_os 
print:
lodsb
cmp al, 0
je printl
mov ah, 0x0e
int 0x10
jmp print

mov si, helping_l
printl:
lodsb
cmp al, 0
je key
mov ah, 0x0e
int 0x10
jmp print

mov si, help
key:
    mov ah, 0x00
    int 0x16          
    cmp al, 'h'        
    jne key        
mov si, help      
print_help:
    lodsb              
    cmp al, 0         
    je key             
    mov ah, 0x0e       
    int 0x10           
    jmp print_help  
    \
halt:
    jmp halt       

help db "https://github.com/tkitty3/KirillIsaev_OS.git", 13, 10, 13, 10, 0
hello_os db "KIRILLISAEV_OS", 13, 10, 13, 10, 0
helping_l db "press h", 13, 10, 0
times 510 - ($ - $$) db 0  
dw 0xAA55            

