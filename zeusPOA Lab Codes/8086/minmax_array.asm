
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

DATA SEGMENT
    ARR DB 5,3,7,1,9,2,6,8,4
    LEN DW $-ARR    ;syntax for length $-varName
    MIN DB ?
    MAX DB ?
DATA ENDS

CODE SEGMENT
ASSUME DS:DATA CS:CODE
START:
    MOV AX, DATA
    MOV DS, AX

    LEA SI,ARR
    MOV AL,ARR[SI]  ; move elements to AL.
    MOV MIN,AL      ;initially set min and max to first element
    MOV MAX,AL
    MOV CX,LEN      ; CX is the counter 

    REPEAT:
    MOV AL,ARR[SI]
    CMP MIN,AL
    JL CHECKMAX     ; jump to checkmax if min is low.
    MOV MIN,AL

    CHECKMAX:       
    CMP MAX,AL
    JG DONE         ; jump to done if max is greater.
    MOV MAX,AL

    DONE:
    INC SI
    LOOP REPEAT     ; LOOP automatic decs counter.

    MOV AH,4CH      ;exit code program
    INT 21H         ;interrupt that terminates the program.
CODE ENDS
END START





