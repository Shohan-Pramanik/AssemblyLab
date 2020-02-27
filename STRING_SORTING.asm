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
    
    MOV AH , 1
    
    TOP:
    INT 21H
    CMP AL , 0DH
    JE EXIT_INPUT
    MOV STR[SI] , AL 
    INC SI 
    INC CX
    JMP TOP
    
    EXIT_INPUT:
    
    LOP1:
    	DEC SI
    	MOV DI,SI
    LOP2:
        DEC DI
    	MOV BL, STR[SI]
    	CMP BL, STR[DI]
    	JG SKIP
    	XCHG BL, STR[DI]
    	MOV str[SI],BL
    	
    SKIP:
        CMP DI,0
    	JNE LOP2
    S2:
        CMP SI,1
    	JG LOP1
	 
	PRINTN
	
	PRINT "SORTED STRING:"

	MOV DI, 0
	MOV AH,2
    NEXT2:
    	MOV DL, STR[DI]
    	INT 21H
    	INC DI
    	CMP DI,CX
    	JB NEXT2
    
    
    MOV AH , 4CH
    INT 21H
    MAIN ENDP
END MAIN