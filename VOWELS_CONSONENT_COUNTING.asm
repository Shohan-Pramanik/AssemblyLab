INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    STR DB 80 DUP (?)
    VAR1 DB 0
    VAR2 DB 0
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
    XOR BX , BX
    
    FOR:
        MOV AL , STR[BX]
        CMP AL , 65
        JL IF
        JMP ELSE_IF
        
        IF:
            INC BX
            JMP EXIT
        
        ELSE_IF:
            CMP AL , 122
            JG IF
            
            CMP AL , 65
            JZ ELSE
            
            CMP AL , 69
            JZ ELSE 
            
            CMP AL , 73
            JZ ELSE
            
            CMP AL , 79
            JZ ELSE
            
            CMP AL , 85
            JZ ELSE
            
            CMP AL , 97
            JZ ELSE
            
            CMP AL , 101
            JZ ELSE
            
            CMP AL , 105
            JZ ELSE 
            
            CMP AL , 111
            JZ ELSE
            
            CMP AL , 117
            JZ ELSE
            
            INC VAR1
            
            INC BX 
            JMP EXIT
        
        ELSE:
            INC VAR2
            INC BX
            JMP EXIT
        
        EXIT:
    
    LOOP FOR 
    
    PRINTN
    
    PRINT "THE NUMBER OF VOWELS:"
    
    MOV AH , 2
    MOV DL , VAR2
    ADD DL , 48
    INT 21H
   
    PRINTN 
    
    PRINT "THE NUMBER OF CONSONENTS:"
    
    MOV AH , 2
    MOV DL , VAR1 
    ADD DL , 48
    INT 21H
    
    MOV AH , 4CH
    INT 21H
    MAIN ENDP
END MAIN