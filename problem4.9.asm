.model small
.stack 100h

.code
main:
    mov ax, @data
    mov ds, ax

    ; prompt
    mov dx, offset msg
    mov ah, 09h
    int 21h

    ; read 1st initial
    mov ah, 01h
    int 21h
    mov bl, al

    ; read 2nd initial
    mov ah, 01h
    int 21h
    mov bh, al

    ; read 3rd initial
    mov ah, 01h
    int 21h
    mov cl, al

    ; new line
    mov dl, 13
    mov ah, 02h
    int 21h
    mov dl, 10
    int 21h

    ; print 1st
    mov dl, bl
    mov ah, 02h
    int 21h

    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; print 2nd
    mov dl, bh
    mov ah, 02h
    int 21h

    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; print 3rd
    mov dl, cl
    mov ah, 02h
    int 21h

    ; exit
    mov ah, 4Ch
    int 21h

.data
msg db 'ENTER THREE INITIALS: $'

end main