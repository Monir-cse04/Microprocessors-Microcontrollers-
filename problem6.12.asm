.model small
.stack 100h
.data
str  db 100 dup('$')
temp db 100 dup('$')
best db 100 dup('$')
msg  db 0Dh,0Ah,'Result: $'

.code
main:
    mov ax,@data
    mov ds,ax

    ; input
    lea si,str
in1: mov ah,1
     int 21h
     cmp al,0Dh
     je done
     mov [si],al
     inc si
     jmp in1

done:
    mov byte ptr [si],'$'

    lea si,str
    lea di,temp

    mov al,[si]
    mov [di],al
    mov bl,al
    inc di

    mov cx,1
    mov dx,1

next:
    inc si
    mov al,[si]
    cmp al,'$'
    je last

    mov ah,bl
    inc ah
    cmp al,ah
    jne reset

    ; increasing
    mov [di],al
    inc di
    inc cx
    mov bl,al
    jmp next

reset:
    cmp cx,dx
    jbe rskip

    ; copy temp ? best
    lea si,temp
    lea di,best
    mov bx,cx
c1: mov al,[si]
    mov [di],al
    inc si
    inc di
    dec bx
    jnz c1
    mov dx,cx

rskip:
    lea di,temp
    mov [di],al      ; start new from current
    inc di
    mov bl,al
    mov cx,1
    jmp next

last:
    cmp cx,dx
    jbe print

    lea si,temp
    lea di,best
    mov bx,cx
c2: mov al,[si]
    mov [di],al
    inc si
    inc di
    dec bx
    jnz c2

print:
    mov byte ptr [di],'$'

    mov ah,9
    lea dx,msg
    int 21h

    mov ah,9
    lea dx,best
    int 21h

    mov ah,4Ch
    int 21h
end main