ORG 0000H
    ; Inicialização - Luz vermelha do carro e vermelho do pedestre
    MOV P2, #14H            ;Liga LED vermelho carro (P2.2) e LED vermelho pedestre (P2.4)

LOOP:
    ; Mantém a luz vermelha do carro por 3 segundos
    CALL DELAY_3S
    
    ; Transição para o amarelo (avisar pedestre para aguardar)
    MOV P2, #12H            ;Liga LED amarelo carro (P2.1)
    CALL DELAY_2S           ;Espera 2 segundos
    
    ; Libera pedestres - muda para o verde do carro e verde do pedestre
    MOV P2, #09H            ;Liga LED verde carro (P2.0) e LED verde pedestre (P2.3)
    CALL DELAY_8S           ;Espera 8 segundos para atravessar

    ; Retorna para o vermelho do carro e acende o vermelho do pedestre
    MOV P2, #14H            ;Liga LED vermelho carro (P2.2) e LED vermelho pedestre (P2.4)
    SJMP LOOP               ;Reinicia o ciclo

; Rotinas de delay
DELAY_3S:
    ; Insere delay de 3 segundos
    MOV R0, #30            ;Ajuste conforme necessário para seu clock
DELAY_3S_LOOP:
    NOP                     ;NOP para gerar delay
    NOP
    DJNZ R0, DELAY_3S_LOOP  ;Decrementa e repete
    RET

DELAY_2S:
    ; Insere delay de 2 segundos
    MOV R0, #20            ;Ajuste conforme necessário para seu clock
DELAY_2S_LOOP:
    NOP
    NOP
    DJNZ R0, DELAY_2S_LOOP  ;Decrementa e repete
    RET

DELAY_8S:
    ; Insere delay de 8 segundos
    MOV R0, #40            ;Ajuste conforme necessário para seu clock
DELAY_8S_LOOP:
    NOP
    NOP
    DJNZ R0, DELAY_8S_LOOP  ;Decrementa e repete
    RET

END 
