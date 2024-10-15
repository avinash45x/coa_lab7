ORG 100h          

MOV DX, OFFSET msg_input  
MOV AH, 09h        
INT 21h            

MOV AH, 01h        
INT 21h            
MOV BL, AL        

CMP AL, '0'        
JL NotDigit        
CMP AL, '9'        
JG NotDigit        

MOV DX, OFFSET msg_output  
MOV AH, 09h        
INT 21h            

MOV DL, BL        
MOV AH, 02h        
INT 21h            
JMP EndProgram    

NotDigit:
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h            

EndProgram:
MOV AH, 4Ch        
INT 21h            

msg_input  DB 'Enter a digit: $'
msg_output DB 0Dh, 0Ah, 'The entered digit is: $'  
msg_error  DB 0Dh, 0Ah, 'Error: Not a digit! $'  

END           