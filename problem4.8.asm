.model small
.stack 100h

.data
msg1 db '?$'
msg2 db 13,10,'THE SUM OF $'
msg3 db ' AND $'
msg4 db ' IS: $'
msg5 db 13,10,'INVALID (SUM >= 10)$'

.code
main:
    mov ax, @data
    mov ds, ax

    ; print ?
    mov dl, '?'
    mov ah, 02h
    int 21h

    ; input 1st digit
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al

    ; input 2nd digit
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bh, al

    ; sum
    mov al, bl
    add al, bh
    cmp al, 10
    jge invalid

    ; print: THE SUM OF
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; print first number
    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h

    ; print " AND "
    lea dx, msg3
    mov ah, 09h
    int 21h

    ; print second number
    mov dl, bh
    add dl, '0'
    mov ah, 02h
    int 21h

    ; print " IS "
    lea dx, msg4
    mov ah, 09h
    int 21h

    ; print sum
    add bl, bh
    mov dl, bl
    add dl, '0'
    mov ah, 02h
    int 21h

    jmp exit

invalid:
    lea dx, msg5
    mov ah, 09h
    int 21h

exit:
    mov ah, 4Ch
    int 21h

end main