# 🚦 **Projeto Semáforo Inteligente: Carros e Pedestres em Harmonia** 🚶‍♂️🚗

Bem-vindo ao **Semáforo Inteligente**, onde carros e pedestres coexistem em perfeita harmonia no trânsito! Este projeto foi desenvolvido para um microcontrolador (o **8051**), controlando semáforos de um cruzamento de maneira simples, mas eficiente. Imagine um mundo onde cada segundo de espera tem um propósito, e cada luz acesa é um sinal de respeito e segurança entre motoristas e pedestres.

### ⚡ **Como Funciona: O Ciclo da Vida de um Semáforo**
Nosso semáforo é muito mais do que um simples conjunto de LEDs! Ele segue uma dança muito bem coreografada entre veículos e pedestres, onde o tempo é o verdadeiro protagonista. 

Aqui está a coreografia do **Ciclo do Semáforo**:
1. **Luz Vermelha - Carros e Pedestres**: Todo o trânsito pára e o cruzamento é ocupado por aqueles que esperam pelo verde.
   - *Cenário*: Carros e pedestres estão se preparando para a ação.
   - **Tempo**: 3 segundos de pausa.
   
2. **Luz Amarela - Alerta para os Carros**: Um sinal de atenção para os carros, enquanto os pedestres aguardam.
   - *Cenário*: Os carros estão quase prontos para ir. Pedestres sabem que precisam esperar.
   - **Tempo**: 2 segundos de cautela.

3. **Luz Verde - A Ação Começa!**: A magia acontece! Carros e pedestres recebem sinal verde para atravessar.
   - *Cenário*: O trânsito flui e os pedestres atravessam com segurança.
   - **Tempo**: 8 segundos de liberdade.

4. **Retorno à Luz Vermelha**: O ciclo recomeça, e todos se preparam para a próxima fase.
   - **Tempo**: E assim o ciclo se repete indefinidamente.

### 💡 **Como o Código Está Organizado?**

Imagine que o nosso semáforo tem uma personalidade própria, e cada parte do código ajuda ele a fazer o seu trabalho!

1. **Inicialização**: O semáforo começa com as luzes vermelhas acesas para todos. A partida do ciclo, o grande começo de uma jornada no trânsito.
   
   MOV P2, #14H  ; Liga LED vermelho para carros (P2.2) e pedestres (P2.4)

2. **Ciclo Principal**: O semáforo vai alternando entre vermelho, amarelo e verde, sempre respeitando os tempos de espera. As luzes piscam e a dança do trânsito começa!

   MOV P2, #12H  ; Liga o amarelo para os carros (P2.1)

3. **Rotinas de Delay**: Aqui estão os "intervalos" de descanso durante a dança. Os delays controlam os tempos entre as fases.

   - **DELAY_3S**: Dá uma pausa de 3 segundos para a luz vermelha.
   - **DELAY_2S**: Um intervalo de 2 segundos para a luz amarela.
   - **DELAY_8S**: A maior pausa, para que os pedestres possam atravessar com calma.

   MOV R0, #30  ; Ajuste do delay para 3 segundos
   DJNZ R0, DELAY_3S_LOOP  ; Decremente e repita até alcançar 3 segundos

4. **Loop Infinito**: Depois de passar por todas as fases, o ciclo começa de novo. Como uma dança eterna que nunca perde o ritmo.

   SJMP LOOP  ; Reinicia o ciclo de semáforo

### 🖥️ **Diagrama de LEDs: A Luz do Trânsito**

Os LEDs são a verdadeira estrela do espetáculo. Cada um tem um papel crucial a desempenhar:

- **Carro**:
  - **Vermelho (P2.2)**: **"Parei!"**
  - **Amarelo (P2.1)**: **"Atenção, estou indo!"**
  - **Verde (P2.0)**: **"Pode seguir!"**
  
- **Pedestre**:
  - **Vermelho (P2.4)**: **"Aguarde!"**
  - **Verde (P2.3)**: **"Siga em frente!"**

### ⏳ **Como Funciona o Tempo?**

O tempo de cada fase é crucial para garantir que tudo corra bem. Os delays estão ajustados para a frequência do seu microcontrolador, mas você pode facilmente personalizar os tempos se quiser.

- **3 segundos**: Para dar tempo aos carros e pedestres se prepararem.
- **2 segundos**: Para alertar os carros que a luz está prestes a mudar.
- **8 segundos**: Tempo suficiente para os pedestres atravessarem a rua com calma.

### 🔧 **Ajustes de Tempo**

- Os valores de `R0` nas rotinas de delay são ajustados conforme o seu relógio (clock) e podem ser alterados para tempos maiores ou menores, conforme necessário. O valor de `R0` define o tempo de espera antes de cada mudança de luz.

### 🚀 **Pronto para Usar?**

1. **Microcontrolador**: 8051 ou similar.
2. **Hardware**: Conecte LEDs às portas P2.0, P2.1, P2.2, P2.3, e P2.4 para ver a magia acontecer.
3. **Clock**: Lembre-se de ajustar os valores de delay dependendo da frequência do seu microcontrolador. Isso faz toda a diferença!

### 🎉 **E aí? Está Pronto para Controlar o Trânsito?**

Este é apenas o começo! Imagine se você integrasse sensores de tráfego para que o semáforo só mudasse quando realmente necessário, ou se você criasse um modo de "modo de emergência" para ambulâncias ou carros de polícia! O céu é o limite para os engenheiros criativos.

---

🎨 **Licença**:  
Este projeto é de código aberto! Use, modifique e compartilhe à vontade, mas sempre com respeito ao trânsito (e aos pedestres!). 😉
