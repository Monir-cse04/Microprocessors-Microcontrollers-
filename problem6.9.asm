.model small
.stack 100h
.code
main:
    mov cx,80h      ; start from 80h
    mov bl,0        ; counter

next:
    mov dl,cl
    mov ah,02h
    int 21h

    mov dl,' '      ; space
    int 21h

    inc bl
    cmp bl,10
    jne skip
             
    ; newline         
    mov dl,0Dh      
    int 21h
    mov dl,0Ah
    int 21h
    mov bl,0

skip:
    inc cl
    jnz next        ; loop till FFh

    mov ah,4Ch
    int 21h
end main