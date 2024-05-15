; Name: Parth Das
; SAPID: 60004220185
; DIV: C2-2
; Roll No: C-111

FACT MACRO F        ;parameter
    UP:
    MUL F           ; mul F with AX  (9*8*7*6*....*1)
    DEC F
    JNZ UP
ENDM

DATA SEGMENT
    NUM DW 09H
    RESULT DW ?
DATA ENDS

STACK SEGMENT           ;stack segment needed
    DW 128 DUP(0)       ;for ease of execution of functions
STACK ENDS

CODE SEGMENT
START:
    MOV AX,DATA
    MOV DS,AX

    MOV CX,NUM      ;move num into CX register(just for ref)
    MOV AX,0001H    ;set AX to 0001h or else it will keep multiplying with zero.
    FACT NUM
    MOV RESULT,AX
CODE ENDS



