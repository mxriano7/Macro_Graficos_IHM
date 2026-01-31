macro_command main()

short base
short critico_up
short critico_down
short atencao_up
short atencao_down
short tensao
short duzentos
short cinquenta
short um
short zero

duzentos = 200
cinquenta = 50
um    = 1
zero  = 0

// ==================================
// BASE CONFIGURÁVEL
// ==================================
GetData(base, "Local HMI", RW, 4010, 1)

// ==================================
// LIMITES DO GRÁFICO (±200)
// ==================================
critico_up   = base + duzentos
critico_down = base - duzentos

SetData(critico_up,   "Local HMI", RW, 4011, 1) // HIGH
SetData(critico_down, "Local HMI", RW, 4012, 1) // LOW

// ==================================
// LIMITES DE ATENÇÃO (±50) – LÓGICO
// ==================================
atencao_up   = base + cinquenta
atencao_down = base - cinquenta

// ==================================
// LEITURA DA TENSÃO
// ==================================
GetData(tensao, "CFW E COEL", 4x, 20#4, 1)
SetData(tensao, "Local HMI", RW, 4014, 1)

// ==================================
// ZERA ESTADOS
// ==================================
SetData(zero, "Local HMI", LB, 4010, 1) // CRÍTICO
SetData(zero, "Local HMI", LB, 4011, 1) // IDEAL
SetData(zero, "Local HMI", LB, 4012, 1) // ATENÇÃO

// ==================================
// LÓGICA DE ESTADO
// ==================================

// 🔴 CRÍTICO (FORA ±200)
if tensao > critico_up then
    SetData(um, "Local HMI", LB, 4010, 1)

else if tensao < critico_down then
    SetData(um, "Local HMI", LB, 4010, 1)

// 🟡 ATENÇÃO (FORA ±50, DENTRO ±200)
else if tensao > atencao_up then
    SetData(um, "Local HMI", LB, 4012, 1)

else if tensao < atencao_down then
    SetData(um, "Local HMI", LB, 4012, 1)

// 🟢 IDEAL (±50)
else
    SetData(um, "Local HMI", LB, 4011, 1)

end if

end macro_command
