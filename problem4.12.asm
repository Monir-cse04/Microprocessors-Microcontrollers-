.model small
.stack 100h

.data
row db '***********',13,10,'$'
c1 db ?
c2 db ?
c3 db ?

.code
main:
    mov ax, @data
    mov ds, ax

    ; display '?'
    mov dl, '?'
    mov ah, 02h
    int 21h

    ; read initials
    mov ah, 01h
    int 21h
    mov c1, al

    mov ah, 01h
    int 21h
    mov c2, al

    mov ah, 01h
    int 21h
    mov c3, al

    ; newline
    mov dl, 13
    mov ah, 02h
    int 21h
    mov dl, 10
    int 21h

    ; top 5 rows
    mov cx, 5
top:
    lea dx, row
    mov ah, 09h
    int 21h
    loop top

    ; middle row ****ABC****
    mov dl, '*'
    mov ah, 02h
    mov cx, 4
s1:
    int 21h
    loop s1

    ; print initials
    mov dl, c1
    int 21h
    mov dl, c2
    int 21h
    mov dl, c3
    int 21h

    mov dl, '*'
    mov cx, 4
s2:
    int 21h
    loop s2

    ; newline
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; bottom 5 rows
    mov cx, 5
bot:
    lea dx, row
    mov ah, 09h
    int 21h
    loop bot

    ; beep
    mov dl, 7
    mov ah, 02h
    int 21h

    ; exit
    mov ah, 4Ch
    int 21h

end main