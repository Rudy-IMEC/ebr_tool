
flowchart TD
    IN[Sensoren/Status<br/>LID, VAC, UVolt, OVolt, OVRLD, WD, EtherCAT, Cobot] --> R[Interlock regels]
    CMD[Intentie: recipe step / command] --> R

    R -->|allow| OK([Uitvoeren<br/>VEL/POS/PUDDLE/Move/etc])
    R -->|block| NOK([Blokkeren<br/>Alarm + outputs safe])



# Interlocks & Safety

| Bron | Voorwaarde | Actie | Herstel |
|---|---|---|---|
| LID | not Closed&Locked | Block motions, outputs OFF | LID sluiten/locken |
