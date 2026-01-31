macro_command main()

short critico
short alto_lim
short meio_lim
short pressao
short vinte
short um
short zero

short critico_g
short alto_g
short meio_g
short pressao_g

vinte = 20
um    = 1
zero  = 0

// ==================================
// LEITURA DO LIMITE CRÍTICO (CFW)
// ==================================
GetData(critico, "CFW E COEL", 4x, 18#6, 1)

// espelho real (lógica)
SetData(critico, "Local HMI", LW, 3000, 1)

// ==================================
// CÁLCULO DOS LIMITES (REAIS)
// ==================================

// ALTO = CRÍTICO - 20
alto_lim = critico - vinte
SetData(alto_lim, "Local HMI", LW, 3001, 1)

// MÉDIO = 50% DO CRÍTICO
meio_lim = critico / 2
SetData(meio_lim, "Local HMI", LW, 3002, 1)

// BAIXO = implícito (< meio)
SetData(zero, "Local HMI", LW, 3003, 1)

// ==================================
// ESCALA ×10 PARA GRÁFICO (RW)
// ==================================
critico_g = critico * 10
alto_g    = alto_lim * 10
meio_g    = meio_lim * 10

SetData(critico_g, "Local HMI", RW, 3000, 1)
SetData(alto_g,    "Local HMI", RW, 3001, 1)
SetData(meio_g,    "Local HMI", RW, 3002, 1)
SetData(zero,      "Local HMI", RW, 3003, 1)

// ==================================
// LEITURA DA PRESSÃO
// ==================================
GetData(pressao, "CFW E COEL", 4x, 18#1, 1)

// pressão escalada p/ gráfico
pressao_g = pressao * 10
SetData(pressao_g, "Local HMI", RW, 3004, 1)

// ==================================
// ZERA ESTADOS
// ==================================
SetData(zero, "Local HMI", LB, 3000, 1)
SetData(zero, "Local HMI", LB, 3001, 1)
SetData(zero, "Local HMI", LB, 3002, 1)
SetData(zero, "Local HMI", LB, 3003, 1)

// ==================================
// LÓGICA DE ESTADO (REAL)
// ==================================

// 🔴 CRÍTICO
if pressao >= critico then
    SetData(um, "Local HMI", LB, 3000, 1)

// 🟠 ALTO
else if pressao >= alto_lim then
    SetData(um, "Local HMI", LB, 3001, 1)

// 🟡 MÉDIO
else if pressao >= meio_lim then
    SetData(um, "Local HMI", LB, 3002, 1)

// 🟢 BAIXO
else
    SetData(um, "Local HMI", LB, 3003, 1)

end if

end macro_command
