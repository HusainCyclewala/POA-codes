; FINDING THE 2ND LARGEST NUMBER IN A STRING OF NUMBERS.
DATA SEGMENT
    arr DB 1,6,8,3,9,4
    len DB 6
DATA ENDS

CODE SEGMENT
    start:
       ASSUME DS: DATA, CS: CODE    
       MOV AX, DATA
       MOV DS, AX
       MOV CH, len      ; counter outer

    outer_loop:
        MOV CL, len     ;inner ccounter
        DEC CL          ;since index starts from 0
        LEA SI, arr     ; SORTING in ascending order
        inner_loop:
            MOV BH, DS:[SI]
            MOV BL, DS:[SI+1]
            CMP BH, BL
            JGE no_swap     ;jump if greater or equal
            MOV DS:[SI+1], BH
            MOV DS:[SI], BL
            no_swap:
                NOP
            INC SI   
            DEC CL
            JNZ inner_loop
        DEC CH
        JNZ outer_loop   
        
        LEA SI, arr
        MOV AL, [SI+1] 
    HLT
    END start
CODE ENDS