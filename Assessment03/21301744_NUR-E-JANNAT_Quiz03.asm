.MODEL SMALL
 
.STACK 100H
.DATA
msg1 DB "Please insert a lowercase letter: $"
msg2 DB "Print the uppercase letter: $"
 
.CODE

 
MAIN PROC 
;iniitialize DS
MOV AX,@DATA 
MOV DS,AX      
;Code here


;DISPLAYING STRING
LEA DX, msg1
MOV AH, 9
INT 21H

;INPUT
MOV AH, 1 ;STORED IN AL
INT 21H

MOV CL, AL



;CMP CL, 65
  

;JG NEXT_LINE:
  


;CURSOR MOVE LEFTMOST      
MOV AH, 2 
MOV DL, 0DH ;CARRIAGE RETURN
INT 21H

;CURSOR IN THE NEXT LINE
MOV DL, 0AH ;CURSOR IN NEXT LINE (LINE FEED)
INT 21H


LEA DX, msg2
MOV AH, 9
INT 21H


;OUTPUT
MOV AH, 2
MOV DL, CL 
INT 21H


;exit to DOS    
MAIN ENDP
    END MAIN 