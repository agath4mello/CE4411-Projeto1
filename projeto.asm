ORG 0000H
    ; Inicio - começa com vermelho
    MOV P2, #04H
    CALL EXIBIR_MENSAGEM

LOOP:
    ; Luz vermelha por 5 segundos
    CALL DELAY_5S
    
    ; Transição para o amarelo (avisar pedestre para aguardar)
    MOV P2, #02H ; LED amarelo ligado (P2.1)
    CALL EXIBIR_AGUARDE
    CALL DELAY_3S
    
    ; Libera pedestres - muda para o verde
    MOV P2, #01H ; LED verde ligado (P2.0)
    CALL EXIBIR_PODE_PASSAR
    CALL DELAY_10S

    ; Retorna para o vermelho e reinicia o loop
    MOV P2, #04H  ; LED vermelho ligado (P2.2)
    CALL EXIBIR_MENSAGEM
    SJMP LOOP

; Sub-rotinas de exibição
EXIBIR_MENSAGEM:
    ; Envia "Carro passando" ao LCD
    ; terminar de desenvolver o código
    RET
EXIBIR_AGUARDE:
    ; Envia "Aguarde" ao LCD
    ; terminar de desenvolver o código
    RET
EXIBIR_PODE_PASSAR:
    ; Envia "Pode atravessar" ao LCD
    ; terminar de desenvolver o código
    RET

; Rotinas de delay
DELAY_5S:
    RET
DELAY_3S:
    RET
DELAY_10S:
    RET

END
