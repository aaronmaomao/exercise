;

section mbr vstart=0x7c00
mov ax, cs
mov ds, ax
mov es, ax
mov ss, ax
mov ax, 0xb800
mov gs, ax

clear:
mov ah, 0x06	;清屏的功能号
mov al, 0		;上卷的行数，全部
mov bx, 0x700
mov cx, 0x00
mov dx, 0x184f
int 0x10

get_cursor:
mov ah, 3
mov bh, 0
int 0x10

put_chars:
mov byte [gs:0x00], 'H'
mov byte [gs:0x01], 0xa4
mov byte [gs:0x02], 'e'
mov byte [gs:0x03], 0xa4
mov byte [gs:0x04], 'l'
mov byte [gs:0x05], 0xa4
mov byte [gs:0x06], 'l'
mov byte [gs:0x07], 0xa4
mov byte [gs:0x08], 'o'
mov byte [gs:0x09], 0xa4
jmp $

put_char:
mov ax, message
mov bp, ax
mov cx, 10
mov ax, 0x1301
mov bx, 0x02
int 0x10
jmp $


display:
mov ax, message
mov bp, ax
mov cx, 16
mov ax, 0x1301
mov bx, 0x000c
mov dl, 0
int 10h
ret
message:
db "Hello world"

times 510-($-$$) db 0
db 0x55, 0xaa
