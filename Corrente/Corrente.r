macro_command main()

short base
short critico
short medio
short corrente
short dez_pct
short um
short zero

um   = 1
zero = 0

// ==================================
// BASE CONFIGURÁVEL (ALTO)
// ==================================
GetData(base, "Local HMI", RW, 3010, 1)
SetData(base, "Local HMI", LW, 3010, 1)

// ==================================
// CÁLCULO DOS LIMITES
// ==================================

// 10% DA BASE
dez_pct = base / 10

// LIMITE CRÍTICO = BASE + 10%
critico = base + dez_pct
SetData(critico, "Local HMI", LW, 3011, 1)

// MÉDIO = 50% DA BASE
medio = base / 2
SetData(medio, "Local HMI", LW, 3012, 1)

// BAIXO = 0
SetData(zero, "Local HMI", LW, 3013, 1)

// ==================================
// ESPELHO PARA RW (GRÁFICOS)
// ==================================
SetData(base,    "Local HMI", RW, 3010, 1)
SetData(critico, "Local HMI", RW, 3011, 1)
SetData(medio,   "Local HMI", RW, 3012, 1)
SetData(zero,    "Local HMI", RW, 3013, 1)

// ==================================
// LEITURA DA CORRENTE
// ==================================
GetData(corrente, "CFW E COEL", 4x, 20#3, 1)

// visualização / gráfico
SetData(corrente, "Local HMI", RW, 3014, 1)

// ==================================
// ZERA ESTADOS
// ==================================
SetData(zero, "Local HMI", LB, 3010, 1) // crítico
SetData(zero, "Local HMI", LB, 3011, 1) // alto
SetData(zero, "Local HMI", LB, 3012, 1) // médio
SetData(zero, "Local HMI", LB, 3013, 1) // baixo

// ==================================
// LÓGICA DE FAIXA
// ==================================

// 🔴 CRÍTICO (> BASE + 10%)
if corrente >= critico then
    SetData(um, "Local HMI", LB, 3010, 1)

// 🟠 ALTO (BASE → < CRÍTICO)
else if corrente >= base then
    SetData(um, "Local HMI", LB, 3011, 1)

// 🟡 MÉDIO (50% → < BASE)
else if corrente >= medio then
    SetData(um, "Local HMI", LB, 3012, 1)

// 🟢 BAIXO (< 50%)
else
    SetData(um, "Local HMI", LB, 3013, 1)

end if

end macro_command
