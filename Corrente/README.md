# ⚡ Macro de Monitoramento de Corrente – Faixas Dinâmicas

**IHM Weintek / WEG CMT1106X – macro_command**

---

## 📌 Visão Geral

Este **macro_command** implementa uma lógica completa e determinística de **monitoramento de corrente elétrica**, baseada em uma **corrente de referência configurável pelo operador** via IHM.

A macro transforma a IHM em um **supervisor ativo do processo**, responsável por:

* Calcular automaticamente limites operacionais
* Classificar a corrente em faixas bem definidas
* Alimentar gráficos e indicadores
* Atualizar estados lógicos exclusivos para alarmes e intertravamentos

Toda a lógica é explícita, auditável e livre de funções prontas ou comportamentos ocultos.

---

## 🎯 Objetivo da Macro

* Permitir ajuste de uma **corrente base nominal** diretamente pela IHM
* Calcular dinamicamente:

  * Limite **Crítico** (+10%)
  * Faixa **Alta**
  * Faixa **Média** (50%)
  * Faixa **Baixa** (implícita)
* Ler a corrente real diretamente do equipamento de campo
* Atualizar estados binários para uso visual e lógico
* Fornecer dados consistentes para gráficos e telas de supervisão

---

## 🧠 Estrutura de Cálculo dos Limites

A lógica parte de um **valor base configurável**, definido pelo operador:

* **Base** → corrente nominal de operação
* **Crítico** → base + 10%
* **Médio** → 50% da base
* **Baixo** → abaixo do médio

Todos os valores reais calculados são armazenados em **LW3010 ~ LW3013**, garantindo:

* Transparência total dos cálculos
* Facilidade de diagnóstico em campo
* Reutilização dos limites em outras lógicas ou alarmes

---

## 📈 Espelhamento para Gráficos (RW)

Os mesmos limites calculados em **LW** são espelhados em **RW**, mantendo uma separação rigorosa entre:

* **Valores reais / engenharia (LW)**
* **Valores de visualização e tendência (RW)**

Essa separação garante:

* Padronização de telas
* Ajustes gráficos independentes da lógica
* Facilidade de expansão para histórico e tendências

---

## 🔌 Leitura da Corrente

A corrente é lida diretamente do equipamento de campo:

* Origem: **CFW / COEL**
* Endereço: **4x 20#3**
* Valor espelhado para gráfico em **RW3014**

A supervisão é sempre baseada no **valor real do processo**, sem escalas ocultas ou conversões implícitas.

---

## 🚦 Lógica de Estados

Antes de qualquer avaliação, todos os estados lógicos são **explicitamente zerados**, evitando sobreposição ou resíduos de ciclos anteriores.

A classificação segue ordem decrescente de severidade:

1. 🔴 **CRÍTICO**
   Corrente ≥ base + 10%

2. 🟠 **ALTO**
   Base ≤ corrente < crítico

3. 🟡 **MÉDIO**
   50% ≤ corrente < base

4. 🟢 **BAIXO**
   Corrente < 50%

Cada faixa ativa **apenas um bit LB**, garantindo:

* Estados exclusivos
* Leitura clara pelo operador
* Uso seguro em alarmes, bloqueios e intertravamentos

---

## 🛠️ Por que usar Macro para isso?

### 🔓 Controle Total

* Fórmulas explícitas
* Nenhuma lógica implícita
* Total domínio sobre critérios e limites

### 🧩 Flexibilidade Operacional

* Ajuste da base sem alterar código
* Fácil modificação de percentuais
* Expansão simples para novos níveis de supervisão

### 🔍 Diagnóstico Industrial

* Valores intermediários visíveis
* Debug direto na IHM
* Comportamento previsível e auditável

Funções prontas dificilmente oferecem esse nível de **clareza, controle e rastreabilidade**.

---

## ✅ Resultado Final

Com este macro, a IHM passa a atuar como um **módulo inteligente de supervisão elétrica**, entregando:

* ✔️ Limites automáticos e dinâmicos
* ✔️ Estados claros e exclusivos
* ✔️ Gráficos consistentes
* ✔️ Lógica industrial robusta e legível

---

🔧 **Conclusão:**
Este macro garante **segurança operacional, flexibilidade de engenharia e total domínio da lógica de corrente**, atendendo aos requisitos de aplicações industriais críticas e bem projetadas.
