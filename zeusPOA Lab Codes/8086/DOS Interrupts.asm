
;Name: Parth Das
; SAPID: 60004220185
; Div: C2-2
; Roll no:C-111

; EXP 10
data segment
    MSG DB "Enter a character:$"
data ends

code segment
assume cs:code, ds:data
start:
    mov ax,data
    mov ds,ax
    ;start
    lea DX, MSG     ;load the string to DX

    MOV AH,09h      ;sets AH to 09 indicating that the following interrput call will diplay a string
    INT 21H         ;DOS services, displaying a string.

    mov AH,01       ;sets AH to 01 indicating that the interrupt will read a char
    int 21H         ;calls intr21 to read a char from std i/p
    mov dl,al       ;moves char read from prev int call from AL to DL

    mov AH,02       ;sets AH to 02 to print a chracter. 
    int 21h         ;print char stored in DL.

    mov ah,4ch      ;To terminate the programme
    int 21h
code ends
end start





