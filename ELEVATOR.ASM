DATA SEGMENT
    PORTA EQU 00H
    PORTB EQU 02H
    PORTC EQU 04H
    PORT_CON EQU 06H 
    feli DW 0h
    maghsad DW 0h  
    Table7Seg DB 0c0h, 0f9h,0a4h ,0b0h, 099h, 092h, 082h, 088h
DATA ENDS

CODE SEGMENT
    ASSUME DS:DATA  ;

START:

    
    MOV DX, PORT_CON
    MOV AL, 082h
    OUT DX, AL  
    
    MOV AL, 0c0h
    MOV DX, PORTA
    OUT DX, AL  
    

click:
    MOV DX, PORTB
    IN AL, DX
    
    
    CMP AL, 11111110B
    JZ F0
    CMP AL, 11111101B
    
    JZ F1
    CMP AL, 11111011B
    JZ F2
    CMP AL, 11110111B
    JZ F3
    CMP AL, 11101111B
    JZ F4
    CMP AL, 11011111B
    JZ F5
    CMP AL, 10111111B
    JZ F6
    CMP AL, 01111111B
    JZ ALARM
    JMP click

F0:
    MOV SI, OFFSET maghsad  
    MOV BX, 0        
    MOV [SI], BX 
  MOV SI, OFFSET feli
    MOV CX, [SI]   
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
   
    MOV AL, 11000000B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F1:
    MOV SI, OFFSET maghsad  
    MOV BX, 1        
    MOV [SI], BX 
  MOV SI, OFFSET feli
    MOV CX, [SI]   
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 11111001B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F2:
 MOV SI, OFFSET maghsad  
    MOV BX, 2        
    MOV [SI], BX          
    
    MOV BX, [SI] 
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 10100100B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F3:
 MOV SI, OFFSET maghsad  
    MOV BX, 3       
    MOV [SI], BX          
    
    MOV BX, [SI] 
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 10110000B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F4:
 MOV SI, OFFSET maghsad  
    MOV BX, 4    
    MOV [SI], BX          
    
    MOV BX, [SI] 
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 10011001B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F5:
 MOV SI, OFFSET maghsad  
    MOV BX, 5        
    MOV [SI], BX          
    
    MOV BX, [SI] 
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 10010010B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

F6:
   MOV SI, OFFSET maghsad  
    MOV BX, 6        
    MOV [SI], BX          
    
    MOV BX, [SI] 
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    CMP BX, CX
    JG L6
    CMP BX, CX
    JL L8
    MOV AL, 10000010B
    MOV DX, PORTA
    OUT DX, AL
    JMP click

ALARM:
       mov dx,portc
   mov al,00001000B
   out dx,al
    MOV AL, 088h
        PUSH CX
    MOV CX, 05FH
MOV DX, PORTA
out dx,ax
D2:
    nop
    LOOP D2

    POP CX
    
    
    MOV SI, OFFSET feli
    MOV aX, [SI]
    MOV SI, OFFSET Table7Seg 
    ADD SI, ax
    mov ax,[si]
    OUT DX, Ax
           mov dx,portc
   mov al,00000000B
   out dx,al
    JMP click

    JMP START  
L6:
       mov dx,portc
   mov al,00000110B
   out dx,al
    MOV SI, OFFSET maghsad           
    MOV BX, [SI]
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    SUB BX, CX
    XCHG BX, CX
L7:
    
   
    CALL DELAY
    INC BX
    MOV SI, OFFSET Table7Seg 
    ADD SI, bx
    MOV AL, [SI]
    MOV DX, PORTA
    OUT DX, AL
    MOV SI, OFFSET feli
    MOV aX, [SI] 
    inc ax
    mov [si],ax
    LOOP L7
          mov dx,portc
   mov al,00000000B
   out dx,al
    JMP click

 L8:
        mov dx,portc
   mov al,00000101B
   out dx,al
    MOV SI, OFFSET maghsad           
    MOV BX, [SI]
    MOV SI, OFFSET feli
    MOV CX, [SI] 
    SUB cx,bx
    MOV SI, OFFSET feli
    MOV bx, [SI] 
L9:
    
    call delay
    MOV SI, OFFSET feli
    MOV aX, [SI] 
    dec ax
    mov [si],ax
    MOV SI, OFFSET Table7Seg 
    ADD SI, ax
    
    MOV AL, [SI]
    MOV DX, PORTA
    OUT DX, AL
    LOOP L9
          mov dx,portc
   mov al,00000000B
   out dx,al
    JMP click  
DELAY PROC NEAR
    PUSH CX
    MOV CX, 01FH

D1:
    MOV DX, PORTB
    in al,dx
    cmp al,07fh
    jz ALARM
    LOOP D1

    POP CX
    RET
DELAY ENDP

CODE ENDS
END START

