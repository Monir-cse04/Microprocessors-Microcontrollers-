
; Problem Statement : Write a program to (a) display a "?", (b) read two decimal digits whose sum is less than 10, 
;(c) display them and their sum on the next line, with an appropriate message.
; Sample execution:
; ?27
; THE SUM OF 2 AND 7 IS 9

.MODEL SMALL
.STACK 100H

.DATA
    PRINT DB '?','$'
    MSG1 DB 0DH, 0AH, "THE SUM OF "
    VAR1 DB ?
    MSG2 DB " AND "
    VAR2 DB ?
    MSG3 DB " IS "
    SUM  DB ?
    DB '$'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; (a) "?" ???????? ???
    MOV AH, 9
    LEA DX, PRINT
    INT 21H

    ; (b) ????? ????? ???
    MOV AH, 1
    INT 21H
    MOV VAR1, AL       ; ASCII '2' ??? ???
    SUB AL, 30H         ; ASCII  (2)
    MOV BL, AL          ; BL ? ????

    ; ??????? ????? ???
    MOV AH, 1
    INT 21H
    MOV VAR2, AL       ; ASCII '7' 
    SUB AL, 30H         ; ASCII , (7)

    ; ????? ??? ???
    ADD AL, BL          ; AL = 2 + 7 = 9
    ADD AL, 30H         ;  ('9')
    MOV SUM, AL         ; SUM 

    ; (c)
    LEA DX, MSG1
    MOV AH, 9
    INT 21H

    ; ????????? ???
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
