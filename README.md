# 🔎 Macros de Supervisão Elétrica e de Processo

**IHM Weintek / WEG CMT1106X – Monitoramento por Macro**

---

## 📌 Visão Geral

Este conjunto de macros constitui um **sistema estruturado de supervisão industrial**, desenvolvido para monitorar **pressão**, **corrente elétrica** e **tensão** de forma **ativa, inteligente e totalmente controlada pela IHM**.

A abordagem adotada transforma a IHM de um simples elemento de visualização em um **componente ativo da lógica de supervisão**, responsável por interpretar dados, calcular limites e classificar estados operacionais em tempo real.

Toda a lógica é implementada via **`macro_command`**, garantindo **domínio total da engenharia** sobre cálculos, estados e decisões.

---

## 🎯 Objetivo do Conjunto de Macros

Os macros foram projetados para:

* Interpretar grandezas elétricas e de processo
* Calcular limites dinâmicos de operação
* Classificar estados por severidade
* Alimentar gráficos, indicadores e alarmes
* Padronizar a supervisão entre diferentes variáveis

O resultado é um sistema **previsível, auditável e industrialmente confiável**.

---

## 🧠 Arquitetura Geral de Funcionamento

Apesar de monitorarem grandezas distintas, todos os macros seguem a **mesma filosofia estrutural**, o que garante padronização e facilidade de manutenção.

### 🔄 Fluxo Lógico Comum

1. **Leitura do valor base**

   * Proveniente do campo (CFW / COEL via Modbus)
   * Ou configurado diretamente pela IHM

2. **Cálculo explícito de limites**

   * Faixa crítica
   * Faixa de atenção (média)
   * Faixa ideal ou baixa

3. **Separação clara de memória**

   * `LW` → valores reais / engenharia
   * `RW` → valores escalados para gráficos e visualização
   * `LB` → estados lógicos e alarmes

4. **Zeragem preventiva de estados**

   * Elimina sobreposição de condições
   * Garante exclusividade dos estados

5. **Classificação por severidade**

   * Avaliação sempre do mais crítico ao mais brando
   * Apenas um estado ativo por ciclo

---

## ⚙️ Macros Implementados

### 📊 Macro de Supervisão de Pressão

Características principais:

* Limites calculados a partir de um **valor crítico real**
* Definição clara das faixas:

  * Baixa
  * Média
  * Alta
  * Crítica

Aplicações típicas:

* Extrusoras
* Sistemas hidráulicos
* Linhas pressurizadas

Permite **reação antecipada** antes que o processo atinja condição crítica.

---

### ⚡ Macro de Supervisão de Corrente

Características principais:

* Valor base configurável pelo operador
* Limites calculados em **percentual**
* Detecção progressiva de sobrecarga

Aplicações típicas:

* Motores elétricos
* Inversores de frequência
* Proteção operacional de máquinas

Funciona como um **pré-alarme inteligente**, evitando atuação apenas em condição extrema.

---

### 🔌 Macro de Supervisão de Tensão

Características principais:

* Faixas simétricas acima e abaixo do valor nominal
* Classificação clara de estados:

  * Ideal
  * Atenção
  * Crítico

Aplicações típicas:

* Qualidade de energia
* Alimentação de inversores
* Diagnóstico de rede elétrica

Detecta **subtensão e sobretensão** com lógica padronizada.

---

## 🚦 Estados Operacionais Padronizados

Todos os macros utilizam **estados lógicos padronizados**, o que facilita integração com:

* Alarmes
* Cores de telas
* Intertravamentos
* Históricos
* Relatórios

Características dos estados:

* Exclusivos
* Determinísticos
* Claramente definidos

---

## 🛠️ Justificativa Técnica – Uso de Macros

### 🔓 Controle Total

* Nenhuma lógica oculta
* Nenhuma função proprietária fechada
* Total domínio sobre cálculos e decisões

### 🧩 Padronização Estrutural

* Mesma lógica aplicada a diferentes grandezas
* Expansão simplificada do sistema
* Facilita treinamento e manutenção

### 🔍 Diagnóstico e Confiabilidade

* Valores intermediários visíveis
* Comportamento previsível
* Debug direto na IHM

A IHM deixa de ser passiva e passa a ser **parte ativa do controle do processo**.

---

## ✅ Benefícios do Conjunto

Com os macros de supervisão implementados, o sistema passa a contar com:

* ✔️ Supervisão elétrica e de processo integrada
* ✔️ Reação antecipada a desvios operacionais
* ✔️ Interface clara e objetiva para o operador
* ✔️ Código auditável e industrial
* ✔️ Total liberdade de engenharia

---

## 🧠 Filosofia de Projeto

A decisão por utilizar **`macro_command`** garante:

* Controle explícito dos cálculos
* Facilidade de auditoria
* Clareza absoluta da lógica
* Adaptação rápida em campo
* Independência de versões e limitações do fabricante

Todos os macros seguem o mesmo conceito base:

1. Leitura do valor base
2. Cálculo explícito dos limites
3. Espelhamento organizado de memória
4. Zeragem preventiva de estados
5. Avaliação lógica por faixas bem definidas

---

## 🏭 Aplicação Industrial

Indicado para:

* Sistemas industriais críticos
* Ambientes que exigem confiabilidade e previsibilidade
* Projetos que precisam ser compreendidos em campo
* Padronização de telas, alarmes e diagnósticos

---

## 🏁 Conclusão

Este conjunto de macros forma uma **base sólida de supervisão industrial**, onde a IHM:

* Interpreta
* Decide
* Sinaliza
* Protege

Mais do que visualização, o projeto entrega **inteligência operacional**, alinhada às exigências da indústria moderna.

---

## ✍️ Assinatura Técnica

**Desenvolvimento e Engenharia:**
**Paulo Cesar Euzebio Mariano Filho**

**Cargo:**
Encarregado de Automação Industrial

**Ano:**
2026

---

**Automação industrial feita para funcionar — e para ser entendida.**
