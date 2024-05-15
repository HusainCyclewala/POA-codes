
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

DATA SEGMENT
STRING1 DB 99H,12H,56H,45H,36H
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
MOV DS,AX

MOV CH,04           ;CH stores no. of iterations needed for outer loop

UP2:MOV CL,04H      ;CL stores the no. of iterations needed for inner loop
LEA SI,STRING1      ;store the string in SI

UP1:MOV AL,[SI]     ;inner loop to compare adjacent elements
MOV BL,[SI+1]
CMP AL,BL

; JNC DOWN  for descending
; JC DOWN for ascending

JC DOWN  
MOV DL,[SI+1]
XCHG [SI],DL        ;we're using XCHG command here
MOV [SI+1],DL

DOWN:INC SI
DEC CL
JNZ UP1
DEC CH
JNZ UP2

CODE ENDS
END START



