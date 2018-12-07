;

section mbr vstart=0x7c00
mov ax, cs
mov ds, ax
mov es, ax
mov ss, ax

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
