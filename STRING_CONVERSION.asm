INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    STR DB 80 DUP (?)
.CODE

MAIN PROC 
    
    MOV AX , @DATA
    MOV DS , AX
    
    PRINT "ENTER THE STRING:"
    
    XOR CX , CX
    XOR BX , BX
    
    MOV AH , 1
    
    TOP:
    INT 21H
    CMP AL , 0DH
    JE EXIT_INPUT
    MOV STR[BX] , AL 
    INC BX 
    INC CX
    JMP TOP
    
    EXIT_INPUT:
    MOV AX , CX 
    XOR BX , BX
    
    FOR:
    MOV AL , STR[BX]
    CMP AL , 65
    JL IF
    JMP ELSE_IF
    
    IF:
    MOV STR[BX] , AL
    INC BX
    JMP EXIT
    
    ELSE_IF:
    CMP AL , 97
    JGE ELSE
    ADD AL , 32
    MOV STR[BX] , AL
    INC BX 
    JMP EXIT
    
    ELSE:
    SUB AL , 32
    MOV STR[BX] , AL
    INC BX 
    
    EXIT:
    
    LOOP FOR
    
    
    
    XOR BX , BX
    MOV CX , AX
    
    PRINTN
    
    MOV AH , 2
    FOR2:
    MOV DL , STR[BX]
    INT 21H
    INC BX
    LOOP FOR2
    
     
    
    
    MOV AH , 4CH
    INT 21H
    MAIN ENDP
END MAIN