  
  
;Name: Parth Das
;SAPID: 60004220185
;DIV: C2-2
;Roll NO:C-111  
  
DATA SEGMENT
    A DB 5
    fact DB ?
DATA ENDS

CODE SEGMENT
ASSUME DS: DATA, CS:CODE
START:
    MOV AX, DATA        ;same
    MOV DS,AX
    MOV AH,00       ; AH with 00
    MOV AL,A        ; AL with the value eg.5 (5*4*3*2*1)
    L1:DEC A
    MUL A           ; A is multiplied with AL
    MOV CL,A
    CMP CL,01
    JNZ L1          ; when 01 is compared to 01 ans in 0.
    MOV fact,AL
CODE ENDS
END START




