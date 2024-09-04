.MODEL SMALL
.STACK 100H
.DATA
ARR DB 5 DUP('?') ;DECLARING ARRAY

MSG1 DB 'Enter the length of your array: $'
MSG2 DB 'Array input: $'

 
.CODE
MAIN PROC 
    MOV AX,@DATA 
    MOV DS,AX
    
     
    ;DISPLAY STRING
    LEA DX, MSG1
    MOV AH, 09 
    INT 21H
    
    MOV AH, 1
    INT 21H
     
    
    ;CURSOR IN THE NEXT LINE
    MOV AH, 2
    MOV DL, 0AH
    INT 21H 
    
    MOV AH, 2
    MOV DL, 0DH
    INT 21H
    
    LEA DX, MSG2
    MOV AH, 09 
    INT 21H 


    MOV SI, OFFSET ARR
    MOV CX, 5

    INPUT:
        MOV AH, 01
        INT 21H
        MOV [SI], AL
        INC SI
        LOOP INPUT  
        
        ;CURSOR IN THE NEXT LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H 
        
        MOV SI, OFFSET ARR
        MOV CX, 5
        
    OUTPUT:  
        MOV AH, 02
        MOV DL, SI+4
        DEC SI
        INT 21H 
        
        
        ;CURSOR IN THE NEXT LINE
        MOV AH, 2
        MOV DL, 0AH
        INT 21H
        
        LOOP OUTPUT
        
       
     MOV AH, 4CH ;RETURN CONTROL TO DOS
     INT 21H 
 
    MAIN ENDP
END MAIN    