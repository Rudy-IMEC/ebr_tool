
flowchart LR
    A([Request versturen]) --> B[Frame verzenden<br/>UDP_SendBuffer + seq_no]
    B --> C[Wachten op RX of timeout]

    C -->|ACKcon ontvangen| D{dlyEC == 0x16?}
    D -->|ja (BUSY)| S[STATreq pollen<br/>tot dlyEC == 0]
    S --> A

    D -->|nee (klaar)| E([Command voltooid])

    C -->|NACKcon| F([Error / geen herhalen])
    C -->|Timeout| R([Retry volgens policy])

# Architectuur

## Lagen
- Hardware IO & BUS
- Drivers/Transports
- Protocol & Devices
- Coordination/Sequencing
- Recipe Engine
- HMI/Visu

## Taken
- EtherCAT_Task (2 ms)
- UDP (20 ms)
- VISU (100 ms)
