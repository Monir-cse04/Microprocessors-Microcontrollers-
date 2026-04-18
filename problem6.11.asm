.model small
.stack 100h
.data
msg db ' ->Invalid!','$'

.code
main:
    mov ax,@data
    mov ds,ax

    mov cx,3          ; 3 tries

again:
    mov ah,01h        ; input
    int 21h

    ; check '0'–'9'
    cmp al,'0'
    jb checkAF
    cmp al,'9'
    jbe valid

checkAF:
    cmp al,'A'
    jb invalid
    cmp al,'F'
    jbe valid

invalid:
    loop again        ; try again

    ; after 3 fails
    mov ah,09h
    lea dx,msg
    int 21h

    mov ah,4Ch
    int 21h

valid:
    mov ah,4Ch
    int 21h

end main