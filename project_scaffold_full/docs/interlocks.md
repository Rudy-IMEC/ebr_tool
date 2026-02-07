
# Interlocks & Safety – Matrix (startpunt)

| Bron | Voorwaarde | Actie (client) | Herstel |
|---|---|---|---|
| LID | Niet Closed&Locked | Block motions (VEL/PUDDLE/POS), outputs OFF; alarm tonen | Sluit & lock | 
| VAC | VAC=ON maar druk te hoog | ProtOFF server → stop sequence; outputs OFF | VAC herstellen | 
| UVOLT | Undervoltage | ProtOFF → motor OFF, outputs OFF | Voeding OK, reset | 
| OVOLT | Overvoltage / remweerstand | ProtOFF | Voeding/parameters OK | 
| OVRLD | Overload/temperatuur | ProtOFF | Afkoelen, waarden verlagen | 
| SW_WD | Watchdog timeout | ProtSTOP; vereis WDENA(1) + WDTRIG periodic | WDENA(1) en retrigger | 
| EtherCAT | Comms down | Blok acties, ventielen dicht (fail‑safe) | Comms herstellen | 
| COBOT | Fault/buiten zone | Blok cobot‑moves | Reset, terug in zone |

**StopConditions** die de server superviseert: UVOLT(bit2,U), OVOLT(bit3,U), OVRLD(bit5,T), SENSORS(bit8,O), UNLOCK(bit9,C), SW_WD(bit10,W), VLIMIT(bit11,T), LID_OPEN(bit13,C), NO_VAC(bit14,C), HW_FAULT(bit19,O), LIM_SW(bit20, T/S – steppers). (Zie manual tabel en types.) citeturn19search1

**Clientverplichtingen tijdens motion**: STATreq cyclisch, `mode` checken, bij 0x01/0x0A oorzaak uit `err_flg` rapporteren met uservriendelijke duiding. citeturn19search1

