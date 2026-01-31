# 📊 Macro de Monitoramento de Pressão e Estados

**IHM Weintek / WEG CMT1106X – macro_command**

---

## 📌 Visão Geral

Este **macro_command** implementa uma lógica completa e determinística de **supervisão de pressão**, realizando:

* Leitura direta de limites do processo
* Cálculo automático de faixas operacionais
* Separação rigorosa entre dados reais e dados de visualização
* Classificação clara de estados operacionais

Toda a lógica é executada **exclusivamente na IHM**, garantindo total domínio da engenharia, previsibilidade e facilidade de diagnóstico.

---

## 🎯 Objetivo do Macro

* Ler o **limite crítico real** diretamente do equipamento de campo (CFW / COEL)
* Calcular automaticamente os limites **Alto** e **Médio**
* Manter valores de engenharia separados dos valores **escalados para gráfico**
* Ler a **pressão atual do processo**
* Classificar a pressão em **quatro estados bem definidos**
* Atualizar **bits lógicos exclusivos** para indicação visual, alarmes e intertravamentos

---

## 🧠 Estrutura de Cálculo dos Limites

A macro trabalha com dois domínios bem definidos:

* **LW** → valores reais de engenharia
* **RW** → valores escalados para visualização

### 📐 Limites Reais (LW)

Os limites são calculados a partir do valor crítico real:

* **Crítico** → leitura direta do campo
* **Alto** → crítico − 20
* **Médio** → 50% do valor crítico
* **Baixo** → implícito (qualquer valor abaixo do médio)

Os valores calculados ficam espelhados em **LW3000 a LW3003**, permitindo:

* Diagnóstico direto na IHM
* Uso em outras lógicas
* Auditoria e manutenção simplificada

---

## 📈 Escala para Gráficos

Para garantir melhor resolução visual e evitar limitações de escala, a macro gera versões **multiplicadas por 10** dos valores:

* **RW3000** → limite crítico ×10
* **RW3001** → limite alto ×10
* **RW3002** → limite médio ×10
* **RW3003** → limite baixo (zero)
* **RW3004** → pressão atual ×10

Essa abordagem garante:

* Gráficos suaves e precisos
* Separação clara entre lógica e apresentação
* Padronização visual em tendências e históricos

---

## 🚦 Lógica de Estados Operacionais

Antes da avaliação, todos os estados são **zerados explicitamente**, eliminando riscos de sobreposição ou estados residuais.

A classificação segue **ordem decrescente de severidade**:

1. 🔴 **CRÍTICO**
   Pressão ≥ limite crítico

2. 🟠 **ALTO**
   Pressão ≥ limite alto

3. 🟡 **MÉDIO**
   Pressão ≥ limite médio

4. 🟢 **BAIXO**
   Pressão abaixo do limite médio

Cada condição ativa **apenas um bit LB**, garantindo:

* Estados mutuamente exclusivos
* Leitura imediata pelo operador
* Uso seguro em alarmes e intertravamentos

---

## 🛠️ Por que usar Macro para isso?

### 🔓 Controle Total

* Cálculos explícitos
* Nenhuma lógica oculta
* Domínio completo sobre limites, escalas e estados

### 🧩 Flexibilidade de Engenharia

* Fórmulas facilmente ajustáveis
* Inclusão simples de novos níveis
* Integração direta com alarmes, históricos e bloqueios

### 🔍 Diagnóstico Industrial

* Todos os valores intermediários visíveis
* Debug direto na IHM
* Comportamento previsível em campo

Funções prontas raramente oferecem esse nível de **transparência, rastreabilidade e controle**.

---

## ✅ Resultado Final

Com este macro, a IHM deixa de ser apenas uma interface gráfica e passa a atuar como um **módulo ativo de supervisão de processo**:

* ✔️ Estados claros e exclusivos
* ✔️ Gráficos precisos e padronizados
* ✔️ Lógica robusta e auditável
* ✔️ Total liberdade de engenharia

---

🔧 **Conclusão**
Este macro transforma a supervisão de pressão em um processo **inteligente, previsível e seguro**, alinhado com aplicações industriais que exigem confiabilidade e clareza absoluta de lógica.
