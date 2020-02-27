INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100
.DATA
    N DB ?
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
    
    MOV CL, 1
    MOV AX, 1
    
    TOP:
    CMP CL, N
    JG LOOP_END
    MUL CL
    INC CL
    JMP TOP
    
    LOOP_END:
    PRINT "THE SERIES SUM IS "
    
    MOV AH, 2
    MOV DX, AX
    ADD DX, 48
    INT 21H
    
    
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
        