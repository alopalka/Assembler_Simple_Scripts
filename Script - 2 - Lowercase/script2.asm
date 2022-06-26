org 100h 

read_text: 
    mov ah, 00h 
    int 16h 
    mov ah, 0

    cmp ax, 0Dh 
    je stop_reading 

    push ax
    mov dx, ax

    mov ah, 02h
    int 21h
    mov ah, 0Fh 
    int 10h
    mov ah, 03h 
    int 10h

    mov ah, 03h 
    int 10h  

    inc dh
    dec dl

    mov ah, 02h 
    int 10h 

    pop dx

    cmp dx, "A"
    jl print_char

    cmp dx, "Z"
    jg print_char

    add dx, 20h

print_char:
    mov ah, 02h
    int 21h

    mov ah, 0Fh 
    int 10h 


    mov ah, 03h 
    int 10h

    mov ah, 03h 
    int 10h  

    dec dh

    mov ah, 02h 
    int 10h 

    jmp read_text 
 
stop_reading: 

    mov ah, 4ch 
    mov al, 00h 
    int 21h 
