
# spinIF Protocol (Firmware v4.25)

## 1. UDP user‑data structuur
| offset | veld | type | betekenis |
|---:|---|---|---|
| 0..1 | id | uint16 (LE) | **0x98FE** |
| 2 | vers | uint8 | **0x02** |
| 3 | seq_no | uint8 | 1..255; 0 alleen voor eerste init/resync |
| 4 | cmd_code | uint8 | request/response code |
| 5 | par_typ | uint8 | PTYP code |
| 6 | par_len | uint8 | lengte payload (bytes) |
| 7 | reserved | uint8 | req: 0, resp: negeren |
| 8..n | payload | — | per PTYP (LE voor 16/32‑bit en floats) |
citeturn19search1

## 2. PTYP (parameter types)
```
PTYP_NONE            = 0x01
PTYP_1xUINT8_HEX     = 0x02
PTYP_1xUINT16_DEC    = 0x03
PTYP_1xUINT16_HEX    = 0x04
PTYP_1xINT16_DEC     = 0x05
PTYP_1xUINT32_DEC    = 0x06
PTYP_1xUINT32_HEX    = 0x07
PTYP_1xINT32_DEC     = 0x08
PTYP_2xUINT8_HEX     = 0x09
PTYP_2xUINT16_DEC    = 0x0A
PTYP_2xUINT32_DEC    = 0x0B
PTYP_PRDDESCcon      = 0x0C
PTYP_PRDVALcon       = 0x0D
PTYP_PWRVALreq       = 0x0E
PTYP_STATcon         = 0x0F
PTYP_STR             = 0x10
PTYP_RESERVED_11     = 0x11
PTYP_SETOUT          = 0x12
PTYP_LDISP           = 0x13
```
citeturn19search1

## 3. Requests (cmd_code) – hoofdcommando’s
- `INITreq  0x40`  (PTYP_NONE) – na ACK herstart; parameters resetten; **wacht tot 10 s** totaal voordat volgende commando. citeturn19search1
- `VELreq   0x01`  (PTYP_1xINT32_DEC) – Incr/s (motor‑as); **Type E** (early‑ACK). citeturn19search1
- `POSreq   0x09`  (PTYP_1xINT32_DEC) – Positioneren (motor‑as). citeturn19search1
- `PUDDLEreq 0x06` (PTYP_2xUINT32_DEC) – triangle profile; **Type E**. citeturn19search1
- `STOPreq  0x03`  (PTYP_NONE) – ramp‑stop, daarna position‑hold. citeturn19search1
- `OFFreq   0x04`  (PTYP_NONE) – niet bij rotatie; eerst STOP + vel laag. citeturn19search1
- `STATreq  0x43`  (PTYP_NONE) – status (STATcon). citeturn19search1
- `WDENAreq 0x45`  (PTYP_1xINT16_DEC) – watchdog enable/disable. citeturn19search1
- `WDTRIGreq 0x46` (PTYP_NONE) – retrigger watchdog. citeturn19search1
- `SETOUTreq 0x47` (PTYP_SETOUT) – digitale/analoge uitgangen. citeturn19search1
- `LDISPreq  0x48` (PTYP_LDISP) – linear dispense arm profiel + DO‑switching. citeturn19search1
- `HM_*` (`HM_REFreq 0x07`, `HM_STOPreq 0x08`, `HM_POSreq 0x09`) – homing; let op overlap met POSreq in documentatie; verifieer in firmware. citeturn19search1
- `Sx_*` (stepper 1..3: VEL/POS/STOP/OFF – `0x11/21/31`, `0x12/22/32`, `0x13/23/33`, `0x14/24/34`). citeturn19search1

## 4. Responses
- `ACKcon  0x81` (PTYP_1xUINT8_HEX – cmd) – positief; bij E‑cmd kan BUSY volgen in STATcon.dlyEC. citeturn19search1
- `NACKcon 0x82` (PTYP_2xUINT8_HEX – cmd,error_code). citeturn19search1
- `PRDDESCcon 0xC1`, `PRDVALcon 0x85`, `STATcon 0xC3`. citeturn19search1

## 5. Early‑ACK/BUSY
- E‑commands geven **early ACK** binnen ~20 ms, **STATcon.spindle.dlyEC=0x16 (BUSY)** tot interne CAN‑interactie klaar is. Tijdens BUSY alleen **STATreq** sturen; geen nieuwe motion‑class. citeturn19search1

## 6. LE encodering (ST‑richtlijnen)
- Integer 16/32 en float32 zijn **little‑endian** in payload. Gebruik helpers om LE te schrijven/lezen (zie `src/helpers/le_helpers.st`). citeturn19search1

## 7. Voorbeeldframes
- **VELreq(1000 rpm → 68267 Incr/s)**: header 98 FE 02, cmd 01, ptyp 08, len 04, reserved 00, payload int32 LE. citeturn19search1
- **ACKcon op VELreq**: cmd 81, ptyp 02, len 01, payload = 01 (ge‑ACK‑te cmd‑code). citeturn19search1

