Sistema de Controle de Sinalização de Trânsito
Este código implementa um sistema simples de controle de semáforo para veículos e pedestres. Utilizando um microcontrolador (presumivelmente 8051 ou similar), ele controla as luzes de semáforo de um cruzamento, alternando entre as fases de sinalização para veículos e pedestres.

Descrição
O sistema de controle de sinalização de trânsito alterna entre diferentes estados de luz para os carros e pedestres, com base em um ciclo de operação pré-definido:
Luz Vermelha Inicial (Carro e Pedestre): Inicialmente, os LEDs de luz vermelha para carros e pedestres são acionados.
Transição para Amarelo (Carro): O semáforo para carros pisca amarelo por 2 segundos, enquanto os pedestres ainda estão com o sinal vermelho.
Luz Verde (Carro e Pedestre): Após o amarelo, o semáforo para os carros e pedestres fica verde por 8 segundos, permitindo que os pedestres atravessem com segurança.
Retorno ao Vermelho: O ciclo se reinicia com as luzes vermelhas para ambos os grupos.

Esquema de Sinalização
Carro (P2.2 e P2.1):
Vermelho: P2.2
Amarelo: P2.1
Verde: P2.0

Pedestre (P2.4 e P2.3):
Vermelho: P2.4
Verde: P2.3

Funcionamento do Código
Inicialização
O código começa com a configuração inicial dos LEDs para que a luz vermelha esteja acesa tanto para os carros quanto para os pedestres.

MOV P2, #14H  ; Liga LED vermelho carro (P2.2) e LED vermelho pedestre (P2.4)

Loop de Operação
O loop principal alterna entre os estados de sinalização utilizando os LEDs correspondentes:
LOOP:
    CALL DELAY_3S  ; Luz vermelha para carro e pedestre por 3 segundos
    MOV P2, #12H   ; Transição para o amarelo do carro (P2.1)
    CALL DELAY_2S  ; Atraso de 2 segundos
    MOV P2, #09H   ; Verde para carro e pedestre (P2.0, P2.3)
    CALL DELAY_8S  ; Atraso de 8 segundos
    MOV P2, #14H   ; Retorno para o vermelho do carro e pedestre
    SJMP LOOP      ; Reinicia o ciclo
    
Funções de Delay
O código utiliza três funções de delay para controlar os tempos de espera entre os diferentes estados de sinalização:
DELAY_3S: Delay de 3 segundos.
DELAY_2S: Delay de 2 segundos.
DELAY_8S: Delay de 8 segundos.
Esses delays são implementados através de loops que decrementam o registrador R0.

Estrutura do Código
O código é organizado da seguinte forma:

Início e Configuração:
O código começa com a configuração dos LEDs de sinalização.

Loop Principal:
Um loop infinito mantém a sequência de sinalização ativa.

Funções de Delay:
Cada função de delay é responsável por gerar um atraso correspondente a um tempo necessário para cada fase da sinalização.

Diagramas de LEDs
P2.0 - Verde para carros
P2.1 - Amarelo para carros
P2.2 - Vermelho para carros
P2.3 - Verde para pedestres
P2.4 - Vermelho para pedestres

Ajustes de Tempo
Os tempos dos delays podem ser ajustados alterando os valores de R0 nas rotinas de delay. O valor de R0 é proporcional ao tempo de espera, dependendo da frequência do clock do microcontrolador.

DELAY_3S: MOV R0, #30
DELAY_2S: MOV R0, #20
DELAY_8S: MOV R0, #40

Requisitos
Microcontrolador: 8051 ou similar.
Hardware: LEDs conectados às portas P2.0, P2.1, P2.2, P2.3 e P2.4.
Clock: O valor de R0 nas rotinas de delay deve ser ajustado conforme a frequência do clock do seu microcontrolador.

Considerações
Este código foi projetado para ser simples e ilustrativo. Em um sistema real, pode ser necessário incluir tratamento de interrupções, segurança adicional para pedestres, sensores de tráfego, e comunicação entre semáforos, dependendo da complexidade do sistema de sinalização.
