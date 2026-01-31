# ⚡ Macro de Monitoramento de Tensão – Faixas Simétricas com Base Ajustável

**IHM Weintek / WEG CMT1106X – `macro_command`**

---

## 📌 Visão Geral

Este **`macro_command`** implementa uma lógica estruturada e determinística de **supervisão de tensão elétrica**, baseada em uma **tensão de referência configurável pelo operador**.

A partir dessa base nominal, o macro constrói **faixas simétricas superiores e inferiores**, classificando o estado da tensão em **Ideal**, **Atenção** ou **Crítico**, com separação explícita entre:

* 📊 Limites destinados à **visualização gráfica**
* 🧠 Limites utilizados para **decisão lógica**
* 🚦 Estados operacionais **exclusivos e bem definidos**

Toda a lógica é calculada de forma explícita, garantindo **controle total, previsibilidade e clareza de engenharia**.

---

## 🎯 Objetivo da Macro

A macro foi projetada para:

* Definir uma **tensão base nominal** via IHM
* Criar faixas simétricas de tolerância em torno da base
* Detectar desvios positivos e negativos
* Alimentar gráficos com limites claros e consistentes
* Gerar estados lógicos confiáveis para alarmes e indicação visual

---

## 🧠 Estrutura de Limites

A lógica utiliza dois níveis distintos de tolerância, sempre **acima e abaixo da tensão base**, garantindo simetria e padronização.

### 🔴 Limites Críticos (±200)

* **Crítico Superior** → `base + 200`
* **Crítico Inferior** → `base − 200`

Aplicação:

* Utilizados **exclusivamente para visualização gráfica**
* Definem a área máxima segura de operação no gráfico

---

### 🟡 Limites de Atenção (±50)

* **Atenção Superior** → `base + 50`
* **Atenção Inferior** → `base − 50`

Aplicação:

* Utilizados para **decisão lógica de estados**
* Permitem identificar desvios antes da condição crítica

---

## 📈 Integração com Gráficos

Os limites críticos e a tensão atual são espelhados em memória **RW**, garantindo separação clara entre lógica e apresentação.

Mapeamento de registradores:

* **RW4011** → Limite crítico superior
* **RW4012** → Limite crítico inferior
* **RW4014** → Tensão atual

Essa abordagem assegura:

* Escala gráfica consistente
* Leitura intuitiva pelo operador
* Independência entre cálculo e visualização

---

## 🔌 Leitura da Tensão de Processo

A tensão monitorada é lida diretamente do equipamento de campo:

* **Origem:** Inversor / controlador (CFW / COEL)
* **Protocolo:** Modbus
* **Endereço:** `4x 20#4`

O valor lido é utilizado para:

* Avaliação lógica das faixas
* Espelhamento para gráfico em **RW4014**

Garantindo que toda a supervisão esteja baseada no **valor real do processo**.

---

## 🚦 Lógica de Estados Operacionais

Antes da avaliação da tensão, todos os estados são **zerados explicitamente**, prevenindo sobreposição de condições.

A classificação segue ordem estrita de severidade:

1. 🔴 **CRÍTICO**
   Tensão fora da faixa **±200** (acima ou abaixo da base)

2. 🟡 **ATENÇÃO**
   Tensão fora da faixa **±50**, porém ainda dentro de **±200**

3. 🟢 **IDEAL**
   Tensão dentro da faixa nominal **±50**

Características da lógica:

* Apenas **um estado ativo por ciclo**
* Estados mutuamente exclusivos
* Uso seguro em alarmes, cores de tela e intertravamentos

---

## 🛠️ Justificativa Técnica – Uso de Macro

### 🔓 Controle Absoluto

* Limites calculados explicitamente
* Nenhuma lógica implícita ou função fechada
* Total domínio sobre critérios de avaliação

### 🧩 Flexibilidade Operacional

* Base ajustável sem alteração de código
* Fácil modificação das tolerâncias
* Estrutura pronta para expansão de novos níveis

### 🔍 Diagnóstico Industrial

* Valores intermediários visíveis
* Debug direto pela IHM
* Comportamento previsível em campo

---

## ✅ Resultado Final

Com este macro, a IHM passa a atuar como um **supervisor ativo de qualidade elétrica**, entregando:

* ✔️ Monitoramento simétrico e coerente
* ✔️ Estados claros e exclusivos
* ✔️ Gráficos bem definidos
* ✔️ Lógica robusta e industrial

---

## 🏁 Conclusão

Este macro transforma a tensão elétrica de um simples valor exibido em uma **variável interpretada**, permitindo decisões rápidas, seguras e fundamentadas no processo industrial.

---

**Automação industrial feita para ser controlada — e compreendida.**
