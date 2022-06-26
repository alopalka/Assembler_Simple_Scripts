org     100h

mov ah, 01h
int 21h

mov ah, 0
sub al, 0x30
push ax
mov ah, 01h
int 21h

mov ah, 0
sub al, 0x30

cmp ax, 0
je skip1

mov cl, al

loop1:
    mov dl, '#'
    mov ah, 02h
    int 21h
    loop loop1

skip1:

pop ax
mov bl, al

cmp bl, 0
je ending 

mov cl, 10

loop2: 
    mov dl, '#'
    mov ah, 02h 
    int 21h
    loop loop2

sub bl, 1
cmp bl, 0
mov cl, 10
jne loop2

ending:
    mov ax, 4C00h
    int 21h
