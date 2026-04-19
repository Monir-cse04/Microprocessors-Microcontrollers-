.model small
.stack 100h
.data
msg db 'enter a hex digit: $'
newline db 0Dh,0Ah ,'DECIMAL : $'   
.code
main proc
    mov ax,@data
    mov ds,ax
     
     ;print msg
     mov ah,9
     lea dx,msg
     int 21h 
     
     mov ah,1
     int 21h
     mov bl,al
     
     sub bl,17  
     ;newline
     mov ah,9
     lea dx,newline
     int 21h
     
     mov ah,2
     
     mov dl,49
     int 21h   
     
     mov ah,2
     
     mov dl,bl
     int 21h      
      
     mov ah,4Ch
     int 21h
     main endp
end main
