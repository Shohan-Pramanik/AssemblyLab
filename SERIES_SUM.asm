INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100
.DATA
    N DB ?
    SUM DB 0
.CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    PRINT "ENTER THE NUMBER:"
    MOV AH, 1
    INT 21H 
    SUB AL, 48
    MOV N, AL
    
    PRINTN
    
    MOV BL, 1
    
    TOP:
    CMP BL, N
    JG LOOP_END
    ADD SUM, BL
    INC BL
    JMP TOP
    
    LOOP_END:
    PRINT "THE SERIES SUM IS "
    
    MOV AH, 2
    MOV DL, SUM
    ADD DL, 48
    INT 21H
    
    
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
        