ORG 100h          
MOV DX, OFFSET msg_input1  
MOV AH, 09h        
INT 21h             

MOV AH, 01h        
INT 21h             ; Get character (ASCII)
MOV BL, AL         ; Store the first digit in BL

; Validate first input
CMP AL, '0'        
JL NotDigit1        ; Jump if less than '0'
CMP AL, '9'        
JG NotDigit1        ; Jump if greater than '9'

; Prompt user for the second digit
MOV DX, OFFSET msg_input2  
MOV AH, 09h        
INT 21h             ; Display prompt for the second digit

; Read second digit
MOV AH, 01h        
INT 21h             ; Get character (ASCII)
MOV BH, AL         ; Store the second digit in BH

; Validate second input
CMP AL, '0'        
JL NotDigit2        ; Jump if less than '0'
CMP AL, '9'        
JG NotDigit2        ; Jump if greater than '9'

; Perform subtraction
SUB BL, BH         ; BL = first digit - second digit

; Print the result message
MOV DX, OFFSET msg_output  
MOV AH, 09h        
INT 21h             ; Display the output message

; Convert result to ASCII and print
ADD BL, '0'        ; Convert back to ASCII
MOV DL, BL         ; Move result to DL for printing
MOV AH, 02h        
INT 21h            ; Print the character
JMP EndProgram     ; Jump to end

; Error handling for first digit
NotDigit1:
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h             ; Display error message
JMP EndProgram      ; Jump to end

; Error handling for second digit
NotDigit2:
MOV DX, OFFSET msg_error  
MOV AH, 09h        
INT 21h             ; Display error message
JMP EndProgram      ; Jump to end

EndProgram:
; Terminate the program
MOV AH, 4Ch        
INT 21h            ; Exit

; Messages
msg_input1 DB 'Enter first digit: $'
msg_input2 DB 0Dh, 0Ah, 'Enter second digit: $'
msg_output DB 0Dh, 0Ah, 'The result is: $'  
msg_error  DB 0Dh, 0Ah, 'Error: Not a valid digit! $'  

END
