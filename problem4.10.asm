.model small
.stack 100h

.data
msg1 db 'ENTER A HEX DIGIT: $'
msg2 db 13,10,'IN DECIMAL IT IS $'

.code
main:
    mov ax, @data
    mov ds, ax

    ; prompt
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; input
    mov ah, 01h
    int 21h

    ; convert A-F ? 10-15
    sub al, 55      ; 'A'=65 ? 10

    mov bl, al

    ; print message
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; print decimal (10–15)
    mov al, bl
    mov ah, 0
    mov cl, 10
    div cl          ; AL=1, AH=remainder

    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    add ah, '0'
    mov dl, ah
    mov ah, 02h
    int 21h

    ; exit
    mov ah, 4Ch
    int 21h

end main