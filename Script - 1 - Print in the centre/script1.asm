org 100h

mov di,0

reading_loop:

    mov ah,00h
    int 16h
    mov ah,0

    cmp al,0Dh
    je add_null_to_end

    mov [ds:di], ax 
    inc di 
    jmp reading_loop


add_null_to_end:
    inc di 
    mov word [ds:di], 0h  
    mov di, 0 

    jmp get_current_place


get_current_place:
    mov ah, 03h 
    int 10h  

    push dx 

    mov ah, 02h 
    mov dh, 20 
    mov dl, 30 
    int 10h 

    jmp printing_loop


printing_loop:

    mov dx, [ds:di] 

    cmp dx,0h

    je ending

    mov ah,02h
    push dx

    int 21h

    inc di
    jmp printing_loop

ending:

    pop dx 
    mov ah, 02h 
    int 10h

    jmp end

end:

    mov ah, 4ch
    mov al, 00h
    int 21h
