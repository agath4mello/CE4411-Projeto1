ORG 0000H
    MOV P2, #04H

INICIO: 
    ;Luz vermelha por 5 segundos
    CALL DELAY_5S  
    MOV P2, #02H 
    ;Luz amarela por 2 segundos
    CALL DELAY_2S 
    MOV P2, #01H
    ;Luz verde por 5 segundos
    CALL DELAY_5S 
    MOV P2, #02H
    CALL DELAY_2S 
    SJMP INICIO   ; Recomeça o ciclo

;  de atraso de 5 segundos
DELAY_5S:
    MOV R3, #50   ; Atraso aproximado de 5 segundos
DELAY_LOOP_5S: 
    CALL DELAY_100MS  ; Chama o atraso de 100 milissegundos
    DJNZ R3, DELAY_LOOP_5S
    RET

;Sub-rotina de atraso
DELAY_2S:
    MOV R3, #20   ; Atraso aproximado de 2 segundos
DELAY_LOOP_2S: 
    CALL DELAY_100MS  ; Chama o atraso de 100 milissegundos
    DJNZ R3, DELAY_LOOP_2S
    RET

;Sub-rotina de atraso
DELAY_100MS:
    MOV R2, #250
DELAY_LOOP_100MS:
    NOP
    DJNZ R2, DELAY_LOOP_100MS
    RET

END