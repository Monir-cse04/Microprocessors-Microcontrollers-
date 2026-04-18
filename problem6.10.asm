.model small
.stack 100h

.data
msg1 db 13,10,'ENTER A HEX DIGIT: $'
msg2 db 13,10,'IN DECIMAL IT IS: $'
msg3 db 13,10,'ILLEGAL CHARACTER - ENTER 0..9 OR A..F: $'
msg4 db 13,10,'DO YOU WANT TO DO IT AGAIN? $'

.code
main:
    mov ax, @data
    mov ds, ax

start:
    ; print prompt
    lea dx, msg1
    mov ah, 09h
    int 21h

read_char:
    mov ah, 01h
    int 21h
    mov bl, al

    ; check 0-9
    cmp bl, '0'
    jl invalid
    cmp bl, '9'
    jle valid_num

    ; check A-F
    cmp bl, 'A'
    jl invalid
    cmp bl, 'F'
    jle valid_hex

invalid:
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp read_char

valid_num:
    sub bl, '0'
    jmp print_dec

valid_hex:
    sub bl, 55        ; 'A' = 65 ? 10 = 65-55

print_dec:
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; convert number in BL to decimal print
    mov al, bl
    cmp al, 10
    jl one_digit

    ; for 10-15
    mov ah, 0
    mov cl, 10
    div cl            ; AL=1, AH=remainder
    add al, '0'
    mov dl, al
    mov ah, 02h
    int 21h

    mov dl, ah
    add dl, '0'
    mov ah, 02h
    int 21h
    jmp ask_again

one_digit:
    add bl, '0'
    mov dl, bl
    mov ah, 02h
    int 21h

ask_again:
    lea dx, msg4
    mov ah, 09h
    int 21h

    mov ah, 01h
    int 21h

    cmp al, 'y'
    je start
    cmp al, 'Y'
    je start

    mov ah, 4Ch
    int 21h

end main