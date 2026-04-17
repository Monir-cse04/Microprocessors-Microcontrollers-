.model small
.stack 100h
.data
msg db '?','$'
newline db 0Dh,0Ah,'$'

.code
main:
    mov ax, @data
    mov ds, ax

    ; display '?'
    mov ah, 09h
    lea dx, msg
    int 21h

    ; read first character
    mov ah, 01h
    int 21h
    mov bl, al

    ; read second character
    mov ah, 01h
    int 21h
    mov bh, al

    ; new line
    mov ah, 09h
    lea dx, newline
    int 21h

    ; compare and print in order
    cmp bl, bh
    jbe print_order

    ; swap
    mov al, bl
    mov bl, bh
    mov bh, al

print_order:
    ; print first
    mov dl, bl
    mov ah, 02h
    int 21h

    ; print second
    mov dl, bh
    mov ah, 02h
    int 21h

    mov ah, 4Ch
    int 21h
end main
