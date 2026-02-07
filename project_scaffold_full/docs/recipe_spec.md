
# Recipe Specificatie (MVP)

## 1. Datatypes (concept)
```iecst
TYPE RECIPE_STEP : STRUCT
    Device   : STRING(16);   // 'spinner' | 'cobot' | 'io' | 'pneumatics'
    Action   : STRING(16);   // bv. 'VEL', 'POS', 'SETOUT', 'MoveLcp' ...
    Param1   : DINT;         // betekenis device‑afhankelijk
    Param2   : DINT;
    Timeout  : TIME;         // stap time‑out
    HoldMs   : UDINT;        // optionele wachttijd na stap
END_STRUCT;

TYPE RECIPE : STRUCT
    Name     : STRING(64);
    Version  : STRING(16);
    Steps    : ARRAY[1..128] OF RECIPE_STEP;
    Count    : UINT;
END_STRUCT;
END_TYPE
```

## 2. Lifecycle
1) **Create/Edit** (HMI Editor) → 2) **Validate** (grenzen, interlocks) → 3) **Save** (tekstformaat) → 4) **Load** → 5) **Prepare** (INIT‑flow, parameters) → 6) **Run** (executor; early‑ACK BUSY‑gating; watchdog) → 7) **Trace** (CSV/JSON). citeturn19search1

## 3. Validator – regels (voorbeeld)
- Vóór motion: LID closed&locked, VAC OK indien relevant, geen PSTOP (mode≠0x0A), WDENA(1). citeturn19search1
- Tijdens BUSY (dlyEC=0x16): alleen STATreq. citeturn19search1
- OFFreq alleen bij `mode`==Stopped en `vel` laag. citeturn19search1

## 4. Persistente opslag
- Bewaar recipes als **.json** of **.yaml** in `/recipes/` met Git versiebeheer; include *schema versie*, *checksum*, *timestamp*, *author*.

## 5. Trace (run‑log)
- Per stap: start/stop‑tijd, uitkomst (ACK/NACK), eventuele `err_flg` snapshot en STATcon kernvelden (mode, dlyEC, vel). citeturn19search1
