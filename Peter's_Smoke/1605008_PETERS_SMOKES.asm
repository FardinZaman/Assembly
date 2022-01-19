.MODEL SMALL
.STACK 100H
.DATA
N DW ?
K DW ?
TEMP1 DW ?
TEMP2 DW ?
TEMP3 DW ?
TOTAL DW ?
.CODE

MAIN PROC
    
    MOV BX,0
    ;MOV BL,10D
    
    INPUT_N:
    
    MOV AH,1
    INT 21H
    
    CMP AL,13D
    JNE NUMBER_N
    
    JMP EXIT_N
    
    NUMBER_N:
             
             
    SUB AL,30H
    
    MOV B.TEMP1,AL
    
    MOV AX,BX
    MOV BX,10D
    MUL BX
    
    ADD AX,TEMP1
    MOV BX,AX
    
    JMP INPUT_N
    
    EXIT_N:
    
    MOV N,BX
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    MOV BX,0
    ;MOV BL,10D
    
    INPUT_K:
    
    MOV AH,1
    INT 21H
    
    CMP AL,13D
    JNE NUMBER_K
    
    JMP EXIT_K
    
    NUMBER_K:
             
             
    SUB AL,30H
    
    MOV B.TEMP2,AL
    
    MOV AX,BX
    MOV BX,10D
    MUL BX
    
    ADD AX,TEMP2
    MOV BX,AX
    
    JMP INPUT_K
    
    EXIT_K:
    
    MOV K,BX
    
    AND DX,0
    XOR AX,AX
    MOV AX,N
    XOR BX,BX
    MOV BX,K
             
    MOV TOTAL,AX
    ;MOV AH,0
    
    COUNT:
    
    CMP AX,BX
    JNGE FINAL
    
    DIV BX
    
    MOV CX,TOTAL
    ADD CX,AX
    MOV TOTAL,CX
    
    ADD AX,DX
    MOV DX,0
    
    LOOP COUNT
    
    FINAL:
    
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    
    AND AX,0
    MOV AX,TOTAL
    MOV DX,0
    ;MOV CL,10D
    
    MOV BX,000H
    ;MOV TEMP3,BX
    
    HOLD:
    
    MOV CX,10D
    DIV CX
    
    ;MOV BX,TEMP3
    
    MOV [000H+BX],DX
    ADD BX,2H
    ;MOV TEMP3,BX
    MOV DX,0
    
    CMP AX,0
    JNE HOLD
    
    PRINT:
    
    ;MOV BX,TEMP3
    SUB BX,2H
    MOV DL,[000H+BX] 
    ADD DL,30H
    
    MOV AH,2
    INT 21H
    
    CMP BX,0
    JNE PRINT
    
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
    END MAIN