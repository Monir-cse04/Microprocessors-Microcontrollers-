.model small
.stack 100h

.data
box db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********',13,10
    db '**********','$'

.code
main:
    mov ax, @data
    mov ds, ax

    lea dx, box
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

end main