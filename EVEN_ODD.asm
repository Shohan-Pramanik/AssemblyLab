INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    DIVISOR DB ?
.CODE

MAIN PROC
    MOV AX , @DATA
    MOV DS , AX
    
    PRINT "ENTER THE NUMBER:"
    MOV AH , 1
    INT 21H 
    SUB AL , 48
    
    MOV DIVISOR , 2 
    
    PRINTN
    
    DIV DIVISOR
    CMP AH , 0
    JE EVEN
    JMP ODD
    
    EVEN:
    PRINT "THE NUMBER IS EVEN"
    JMP EXIT
    
    ODD:
    PRINT "THE NUMBER IS ODD"
    
    EXIT:
    
    
    
    MOV AH , 4CH
    INT 21H
    MAIN ENDP
END MAIN