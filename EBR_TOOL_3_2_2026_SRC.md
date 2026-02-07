# EBR_TOOL_3_2_2026 — Single Source (POUs, Types, GVLs, Methods, Docs)

> Auto-generated from PLCopen XML. Update this file whenever the project changes.


## Metadata

- **Company**: 

- **Product**: CODESYS

- **ProductVersion**: CODESYS V3.5 SP20 Patch 4

- **Created**: 2026-02-07T13:49:39.8490006

- **Project Name**: EBR_TOOL_3_2_2026.project

- **Last Modified**: 2026-02-07T13:15:54.9506986


## Resources & Tasks


### Configuration: Device

- **Resource**: Application

  - Task **EtherCAT_Task** — interval: `PT0.002S`, priority: `3`

    - POU Instance: Hardware

    - POU Instance: Main

  - Task **UDP** — interval: `PT0.02S`, priority: `20`

    - POU Instance: HTTP_Client

  - Task **VISU_TASK** — interval: `PT0.1S`, priority: `31`

    - POU Instance: VisuElems.Visu_Prg


### Configuration: PLC_Diagnosis


### Configuration: CPX_E_System_1


### Configuration: CPX_E_System


### Configuration: EtherNet_IP_Device


### Configuration: CPX_AP_A_EC_M12


### Configuration: VTEP_2X


### Configuration: CPX_AP_A_4IOL_M12_Variant_4


### Configuration: CPX_AP_A_4IOL_M12_Variant_32


### Configuration: CPX_AP_A_EC_M12_1


### Configuration: VABX_A_P_EL_E12_APA


### Configuration: _32_Byte_EtherNet_IP_I_O


## User Data Types (TYPE)

```iecst
TYPE STATCON_FULL : STRUCT
    spindle : STAT_SPINDLE;
    stepper : ARRAY[0..2] OF STAT_STEPPER;
    io : STAT_IO;
    aout_DP_DAC : ARRAY[0..2] OF UINT;
    hasDP_DAC : BOOL;
    stopConds : UDINT;
    hasStopConds : BOOL;
END_STRUCT;
END_TYPE;
```

```iecst
TYPE NACK_ERR : ( 
    UNSUPPORTED_CMD := 16#1,
    INVALID_PID := 16#2,
    INVALID_IDX := 16#3,
    INVALID_VALUE := 16#4,
    INVALID_TYPE := 16#5,
    ACCESS_DENIED := 16#6,
    SAVE_FAILED_EEPROM := 16#7,
    LOAD_FAILED_EEPROM := 16#8,
    SAVE_FAILED_FLACH := 16#9,
    LOAD_FAILED_FLACH := 16#A,
    MOTOR_PAR_SAVE_FAILED := 16#B,
    MOTOR_PAR_LOAD_FAILED := 16#C,
    PROC_FAILED := 16#D,
    STOPCONDS := 16#E,
    MOTOR_CAL_SAVE_FAILED := 16#F,
    MOTOR_CAL_LOAD_FAILED := 16#10,
    MOTOR_CAL_TYPE_FAILED := 16#11,
    ACCESRIGHT_TO_LOW := 16#12,
    ENCODER_COM_FAILED := 16#13,
    NO_REQ_ALLOWD_OP := 16#14,
    PTYPE_LEN_MISMATCH := 16#15
) ;
END_TYPE;
```

```iecst
TYPE CMD : ( 
    VELreq := 16#1,
    POSreq := 16#9,
    PUDDLEreq := 16#6,
    STOPreq := 16#3,
    OFFreq := 16#4,
    STATreq := 16#43,
    INITreq := 16#40,
    PRDDESCreq := 16#41,
    PRDVALreq := 16#5,
    PWRVALreq := 16#42,
    WDENAreq := 16#45,
    WDTRIGreq := 16#46,
    SETOUTreq := 16#47,
    LDISPreq := 16#48,
    S1_VELreq := 16#11,
    S1_POSreq := 16#12,
    S1_STOPreq := 16#13,
    S1_OFFreq := 16#14,
    S2_VELreq := 16#21,
    S2_POSreq := 16#22,
    S2_STOPreq := 16#23,
    S2_OFFreq := 16#24,
    S3_VELreq := 16#31,
    S3_POSreq := 16#32,
    S3_STOPreq := 16#33,
    S3_OFFreq := 16#34,
    ACKcon := 16#81,
    NACKcon := 16#82,
    PRDDESCcon := 16#C1,
    PRDVALcon := 16#85,
    STATcon := 16#C3
) ;
END_TYPE;
```

```iecst
TYPE PTYP : ( 
    NONE := 16#1,
    _1xUINT8_HEX := 16#2,
    _1xUINT16_DEC := 16#3,
    _1xUINT16_HEX := 16#4,
    _1xINT16_DEC := 16#5,
    _1xUINT32_DEC := 16#6,
    _1xUINT32_HEX := 16#7,
    _1xINT32_DEC := 16#8,
    _2xUINT8_HEX := 16#9,
    _2xUINT16_DEC := 16#A,
    _2xUINT32_DEC := 16#B,
    PRDDESCcon := 16#C,
    PRDVALcon := 16#D,
    PWRVALreq := 16#E,
    STATcon := 16#F,
    SETOUT := 16#12,
    LDISP := 16#13
) ;
END_TYPE;
```


### Doc: PTYP

```
Parameter type codes — encoding of payloads; STATcon is 0x0F.
```

```iecst
TYPE STAT_SPINDLE : STRUCT
    pos : DINT;
    err_flg : UDINT;
    vel_rpm : INT;
    mode : BYTE;
    home_st : BYTE;
    dlyEC : BYTE;
END_STRUCT;
END_TYPE;
```

```iecst
TYPE STAT_STEPPER : STRUCT
    pos : DINT;
    capt_pos : DINT;
    err_flg : UDINT;
    vel_incrs : DINT;
    mode : BYTE;
    capt_evt : BYTE;
END_STRUCT;
END_TYPE;
```

```iecst
TYPE STAT_IO : STRUCT
    din_bits : UDINT;
    vac_kPa : INT;
    Uin_V : INT;
    dout_bits : UDINT;
    vac_state : BYTE;
END_STRUCT;
END_TYPE;
```

```iecst
TYPE STOPCONDS_REC : STRUCT
    UVOLT : BOOL;
    OVOLT : BOOL;
    OVRLD : BOOL;
    SENSORS : BOOL;
    UNLOCK : BOOL;
    SW_WD : BOOL;
    VLIMIT : BOOL;
    LID_OPEN : BOOL;
    NO_VAC : BOOL;
    HW_FAULT : BOOL;
    LIM_SW : BOOL;
END_STRUCT;
END_TYPE;
```


### Doc: STOPCONDS_REC

```
Types used by DecodeStopConds
```

```iecst
TYPE STOPCOND_BIT : ( 
    UVOLT := 2,
    OVOLT := 3,
    OVRLD := 5,
    SENSORS := 8,
    UNLOCK := 9,
    SW_WD := 10,
    VLIMIT := 11,
    LID_OPEN := 13,
    NO_VAC := 14,
    HW_FAULT := 19,
    LIM_SW := 20
) ;
END_TYPE;
```

```iecst
TYPE PID_VALKIND : ( 
    PIDVAL_INT32 := 1,
    PIDVAL_FLOAT := 2,
    PIDVAL_U32HX := 3,
    PIDVAL_STR := 4
) ;
END_TYPE;
```


## Global Variable Lists (GVL)

```iecst
// pers
VAR_GLOBAL RETAIN PERSISTENT
    WarningLog : ARRAY[0..299] OF STRING;
    WloggingCounter : INT;
    AlarmLog : ARRAY[0..299] OF STRING;
    AloggingCounter : INT;
    SnijtijdMes : ULINT;
    Wenstemperatuur : REAL;
    mute : BOOL;
    CobotPos : ARRAY[0..9] OF fr.DUT_CobotPosition;
    toollist : ARRAY[0..9] OF fr.DUT_Toolpose;
END_VAR
```

```iecst
// Const
VAR_GLOBAL CONSTANT
    _PI : REAL := 3.14159265359;
    Radian : REAL := 57.2957795;
    PID_Spindle_Vmax : UINT := 1002;
    PID_S1_Disp_Vmax : UINT := 1052;
    PID_S2_Open_Vmax : UINT := 1102;
    PID_S3_Lock_Vmax : UINT := 1152;
    Transport_UseTcp : BOOL := TRUE;
    SPIN_MAGIC : UINT := 16#98FE;
    SPIN_VERSION : BYTE := 16#2;
    SPIN_REMOTE_PORT : UINT := 47999;
    TO_CLASS_20MS : TIME := TIME#20ms;
    TO_CLASS_1S : TIME := TIME#1s0ms;
    TO_CLASS_10S : TIME := TIME#10s0ms;
    RETRY_MAX : UINT := 4;
    DLYEC_BUSY : BYTE := 16#16;
    SPIN_TX_MAX : UDINT := 256;
    SPIN_RX_MAX : UDINT := 128;
END_VAR
```

```iecst
// GVL
VAR_GLOBAL
    ResetEtherCat : BOOL;
    DTG_G_PidNames : ARRAY[1..34] OF STRING(64) := ['UnlockMaxOnTime', 'VAC limit', 'Autolid', 'GrearFactor', 'deviceSize', 'VlimUsr', 'Resolution', 'WatchdogTimeout', 'Spindle.Vmax', 'Spindle.Amax', 'Dmax', 'PstopDmax', 'S1_Disp.Vmax', 'S1_Disp.Amax', 'S1_Disp.Imax', 'S2_Open.Vmax', 'S2_Open.Amax', 'S2_Open.Imax', 'S3_Lock.Vmax', 'S3_Lock.Amax', 'S3_Lock.Imax', 'SoftwareVers', 'SoftwareDate', 'SoftwareTime', 'Im', 'Usc', 'Position', 'Speed', 'shaftRPM', 'TimeLeft', 'StopConditions', 'State', 'NewCmd.Command', 'CurrCmd.Command'];
    DTG_G_PidIds : ARRAY[1..34] OF UINT := [21, 22, 24, 25, 26, 304, 403, 1001, 1002, 1003, 1004, 1005, 1052, 1053, 1055, 1102, 1103, 1105, 1152, 1153, 1155, 2001, 2002, 2003, 2159, 2160, 2401, 2402, 2420, 2421, 2503, 3001, 3021, 3041];
    LockUnlockTool : BOOL := FALSE;
    SaveReceiptIn : BOOL := FALSE;
    GoToSave : BOOL := FALSE;
    Valve1 : WORD := 10;
    Ctrl_Valve1 : WORD := 0;
    Act_P_Valve1 : WORD;
    Error_Valve1 : BOOL;
    RunRecipt : ARRAY[1..8, 1..30] OF INT;
END_VAR
```

```iecst
// HW
VAR_GLOBAL
    Cobot : fr.FairinoCobot;
END_VAR
```

```iecst
// DTG_SEQ_Pools
VAR_GLOBAL
    DTG_ARR_INT : ARRAY[0..63] OF INT;
    DTG_ARR_DINT : ARRAY[0..63] OF DINT;
    DTG_ARR_REAL : ARRAY[0..63] OF REAL;
    DTG_ARR_BYTE : ARRAY[0..63] OF BYTE;
    DTG_ARR_UINT : ARRAY[0..63] OF UINT;
    DTG_ARR_UDINT : ARRAY[0..63] OF UDINT;
END_VAR
```

```iecst
// GVL_Visu
VAR_GLOBAL
    Visu_Mode : BYTE := 0;
    Visu_dlyEC : BYTE := 0;
    Visu_Busy : BOOL := FALSE;
    Visu_Stop_UVOLT : BOOL := FALSE;
    Visu_Stop_OVOLT : BOOL := FALSE;
    Visu_Stop_OVRLD : BOOL := FALSE;
    Visu_Stop_SENSORS : BOOL := FALSE;
    Visu_Stop_UNLOCK : BOOL := FALSE;
    Visu_Stop_SW_WD : BOOL := FALSE;
    Visu_Stop_VLIMIT : BOOL := FALSE;
    Visu_Stop_LID_OPEN : BOOL := FALSE;
    Visu_Stop_NO_VAC : BOOL := FALSE;
    Visu_Stop_HW_FAULT : BOOL := FALSE;
    Visu_Stop_LIM_SW : BOOL := FALSE;
END_VAR
```

```iecst
// GVL_UDP_IO
VAR_GLOBAL
    UDP_SendBuffer : ARRAY[0..32] OF BYTE;
    UDP_SendLength : UDINT := 0;
    UDP_TriggerSend : BOOL := FALSE;
    UDP_RecvBuffer : ARRAY[0..150] OF BYTE;
    UDP_RecvLength : UDINT := 0;
    UDP_NewData : BOOL := FALSE;
END_VAR
```


## POUs (Programs / Function Blocks / Functions)


### Hardware  —  PROGRAM

```iecst
VAR
    StringApi : STRING;
    EthercatOperational : BOOL;
    FirstTimeOperational : BOOL;
    TimerEthercat : ULINT;
END_VAR
```

```iecst
hw.Cobot(sIpAddr := '192.168.0.30',iCobotNr := 2,sCobotName := '1',ToolList := pers.toollist,xEnable := TRUE);
```


### Clock  —  FUNCTIONBLOCK

```iecst
VAR_INPUT
    stdNew : SysTimeDate;
END_VAR
```

```iecst
VAR_OUTPUT
    tAbsolute : ULINT;
    Alternating : BOOL;
    _1HZ : BOOL;
    _2HZ : BOOL;
    _10HZ : BOOL;
    _100HZ : BOOL;
    _1SHighop10Sec : BOOL;
    AvgCycleTime : REAL;
    Dag : INT;
    Maand : INT;
    Jaar : INT;
    Uur : INT;
    Minuten : INT;
    Seconden : INT;
    Datum : STRING;
    Datum_file : STRING;
    Tijd : STRING;
    DatumTijd : STRING;
    SaveRecipe : BOOL;
    SetResult : DWORD;
END_VAR
```

```iecst
VAR
    _1HZStart : ULINT;
    _2HZStart : ULINT;
    _10HZStart : ULINT;
    _100HZStart : ULINT;
    Currenttime : TIME;
    PlcTime : ULINT;
    _10start : ULINT;
    stUTC_Timestamp : SysTime;
    SetTime : BOOL;
END_VAR
```

```iecst
// nieuwe tijd instellen via plc shell
// setrtc 2025-1-30-11:00:20


Currenttime := TIME();
tAbsolute    := TO_ULINT(Currenttime);

IF SetTime THEN // SetTime wordt vanuit scherm aangestuurd. Dit is om de actuele tijd/datum in te stellen.
    IF SetTimeAndDate() THEN
        SetTime := FALSE;
    END_IF
END_IF

IF tAbsolute > _1HZStart + 1000 THEN
    _1HZ := NOT _1HZ;
    _1HZStart := tAbsolute;
    RealClock();
END_IF

IF tAbsolute > _2HZStart + 500 THEN
    _2HZ := NOT _2HZ;
    _2HZStart := tAbsolute;
END_IF

IF tAbsolute > _10HZStart + 100 THEN
    _10HZ := NOT _10HZ;
    _10HZStart := tAbsolute;
END_IF

IF tAbsolute > _100HZStart + 10 THEN
    _100HZ := NOT _100HZ;
    _100HZStart := tAbsolute;
END_IF

IF tAbsolute > _10start + 10000 THEN // 10s
    _10start := tAbsolute;
END_IF

_1SHighop10Sec := tAbsolute > _10start + 9700;

Alternating := NOT alternating;

//CycleCounter := CycleCounter + 1;

// IF CycleCounter > 1000 THEN
//     CounterDuration := tAbsolute - CycleCounterStart;
//     AvgCycleTime := TO_REAL(CounterDuration)/1000;
//     CycleCounterStart := tAbsolute;
//     CycleCounter := 0;
// END_IF
```


**Method: RealClock**

```iecst
VAR
    uDag : UINT;
    uMaand : UINT;
    uJaar : UINT;
    uUur : UINT;
    uMinuten : UINT;
    uSeconden : UINT;
END_VAR
```

```iecst
Util.GetDateTime(getdatetime => PlcTime);
util.SplitDateTime(uliDateTime := PlcTime, uiyear => ujaar, uimonth => uMaand ,uiDay=> uDag , uihour => uUur ,uiminute => uMinuten , uisecond => uSeconden);


Dag            :=     TO_INT(uDag);            
Maand        :=     TO_INT(uMaand);            
Jaar        :=     TO_INT(uJaar);            
Uur            :=     TO_INT(uUur);            
Minuten        :=     TO_INT(uMinuten);        
Seconden    :=     TO_INT(uSeconden);            
                                               

// datum,maanden 01 ipv 1 ,...
IF  maand < 10 THEN
    Datum := concat(concat(concat(concat(INT_TO_STRING(Dag),'/0'),INT_TO_STRING(maand)),'/'),INT_TO_STRING(jaar));
    Datum_file := concat(concat(concat(concat(INT_TO_STRING(Dag),'_0'),INT_TO_STRING(maand)),'_'),INT_TO_STRING(jaar));
ELSE
    Datum := concat(concat(concat(concat(INT_TO_STRING(Dag),'/'),INT_TO_STRING(maand)),'/'),INT_TO_STRING(jaar));
    Datum_file := concat(concat(concat(concat(INT_TO_STRING(Dag),'_0'),INT_TO_STRING(maand)),'_'),INT_TO_STRING(jaar));
END_IF


// door omvorming volgend probleem 1 min zou 01 min moeten zijn.. 1 sec 01 sec... daarom de volgende ifs...
IF minuten < 10 AND seconden < 10 THEN
    tijd := concat(concat(concat(concat(INT_TO_STRING(uur),':0'),INT_TO_STRING(minuten)),':0'),INT_TO_STRING(seconden));
ELSIF minuten < 10 AND seconden >= 10 THEN
    tijd := concat(concat(concat(concat(INT_TO_STRING(uur),':0'),INT_TO_STRING(minuten)),':'),INT_TO_STRING(seconden));
ELSIF minuten >= 10 AND seconden < 10 THEN
    tijd := concat(concat(concat(concat(INT_TO_STRING(uur),':'),INT_TO_STRING(minuten)),':0'),INT_TO_STRING(seconden));
ELSE
    tijd := concat(concat(concat(concat(INT_TO_STRING(uur),':'),INT_TO_STRING(minuten)),':'),INT_TO_STRING(seconden));
END_IF
DatumTijd := concat(concat(tijd,' '),datum);
```


**Method: SetTimeAndDate**

- Return type: `BOOL`

```iecst
SetResult :=SysTimeRtcConvertLocalToHighRes(stdNew, stUTC_Timestamp); // ULINT#1528273494913
SetResult := SysTimeRtcHighResSet(stUTC_Timestamp);// Writing a high resolution value of type ``SysTime`` to the realtime clock (RTC) device.

IF SetResult = 0 THEN
    SetTimeAndDate := TRUE;
END_IF
```


### Main  —  PROGRAM

```iecst
VAR
    stepC : INT := 0;
    cp : fr.DUT_CobotPosition;
    Delay : TON;
    Treset : BOOL;
    TStart : BOOL;
    Cli : FB_PolosClient;
    BtnInit : BOOL := TRUE;
    pInit : BOOL := FALSE;
    okTry : BOOL;
    step : UINT := 0;
    ok : BOOL;
    tWait : TON;
END_VAR
```

```iecst
GVL.ResetEtherCat := TRUE;




// --- Modus ophalen
(*useTcp := Transport_UseTcp;



// --- Parameters + start
Sm.ReadPid  := 1002;
Sm.ReadIdx  := 0;
Sm.VelValue := 12000;

IF bootStart THEN
    Sm(Start := TRUE);
    bootStart := FALSE;
ELSE
    Sm(Start := HMI_StartRun);
    HMI_StartRun := FALSE;
END_IF

// --- Cyclisch SM
Sm();

// --- TX/RX via actief pad
IF useTcp THEN
    IF Tcp.Connected AND Sm.SendReq THEN
        Tcp.Send(pSrc := Sm.SendPtr, udiLen := Sm.SendLen);
    END_IF
    Tcp.PollRx();      // non-blocking
ELSE
    IF Udp.Connected AND Sm.SendReq THEN
        Udp.Send(pSrc := Sm.SendPtr, udiLen := Sm.SendLen);
    END_IF
    Udp.PollRx();      // non-blocking
END_IF

IF SM.SendReq THEN
    MemSet(ADR(HTTP_Client.SendMessage),0,SIZEOF(HTTP_Client.SendMessage));
    MemCpy(ADR(HTTP_Client.SendMessage),SM.SendPtr,SM.SendLen);
    HTTP_Client.UdpSend(udiSize := SM.SendLen);
    
END_IF*)


// Rising-edge detectie

// 1) ALTIJD eerst de FB laten lopen
Cli();

// 2) Rising edge - alleen starten als FB niet busy is
IF (BtnInit AND NOT pInit) THEN
    pInit := TRUE;
    IF NOT Cli.xBusy THEN
        okTry := Cli.DoINIT();     // <- hier krijgt de FB de kans om het frame te bouwen
    END_IF
END_IF;
IF NOT BtnInit THEN pInit := FALSE; END_IF;




CASE stepC OF
    0: ;    
    1: IF hw.Cobot.reset() THEN stepC :=0; END_IF    
    2: hw.Cobot.MoveLcp(position:= pers.CobotPos[0],speed := 20,workPieceNum := 0,toolNum := 1); 
    3: hw.Cobot.MoveLcp(position:= pers.CobotPos[1],speed := 10,workPieceNum := 0,toolNum := 1); 
    4: IF hw.Cobot.ResetAllError() THEN
            stepC :=0;
        END_IF
    5: IF hw.Cobot.MoveJcp_Rel(offset_flag := 2,x := 50,z:= 35,toolNum := 1,speed := 10)AND stepC =5 THEN stepC:=1;END_IF 
    
        
    6: ;//Test();
    7: Delay(IN:=TRUE,PT:= T#20S); IF Delay.Q THEN stepC :=5; END_IF

    10: hw.Cobot.SetDragmode(status := 1); 
    11: hw.Cobot.SetDragmode(status := 0); 
    12: IF tReset THEN
            Delay(IN := FALSE);   // Forceer reset
        END_IF
END_CASE

(*INIT Spinner: INITreq=>wait 3sec or more=> PRDVALreq(PID=2001 software version
index=0=>must be 425 or 01.A9(BE)=> set PID device size => Set PID AutoLid => set
PID gear factor *)
  



// On start (start-visu; start button) load recipt if not: popup to select one

// popup load sample, case vacuum or not swich on vacuum button, open lid
// confirm sample load, close lid
// if lid is closed, check wetbench window, popup close wetbench window 
// Look in step1 witch tool the robot must pick
// Robot picks tool (from home to tool) and take parking position (if needed)
// Run first step spinner and robot, repead if needed on same sample
// is there a second step Yes-> goto look in step2 NO-> is there a new sample to run, yes robot stays in parking and sample load NO robot moves to put back the tool and homes

// during steps check solvent flow, solvent level, keep in contact with alarm manager
//From recipt:
(*    Total number of steps
    take first step
    Vacuum need yes/no
    Solvent need yes/no
    N2 need yes/no
    EBR BSR or Spin_Rinse
    To load sample:
        Unlock lid UDP message with ack/nack
        Open lid UDP message with ack/nack
        if needed vacuum UDP message with ack/nack
        Close lid UDP message with ack/nack
        Lock lid UDP message with ack/nack
    IF solvent then robot action:
        Case solvent
    Set first time in timer 1 (time with the first speed)
    Send speed, acc, watchdog, UDP message with ack/nack
    Move robot if needed
    Start flow if needed
    Start in the timer a second timer stabilization
    On first timer end start new time *)
```


### FileList  —  PROGRAM

```iecst
// Open SD card directory to list all filenames in an ARRAY
```


### Test  —  PROGRAM

```iecst
VAR
    H_Flow : WORD;
    L_Flow : WORD;
    R_Flow : WORD;
    C_Flow : WORD;
END_VAR
```

```iecst
hw.Cobot.RunFile(filename:='test1');


C_Flow:= SHL(H_Flow,8);
R_FLOW:= C_FLOW OR L_FLOW;
```


### VisuBlock  —  PROGRAM

```iecst
VAR_INPUT
    VisuStep : ARRAY[1..10] OF BOOL;
    Index : INT := 1;
    PrevIndex : INT := (VisuBlock.Index - 1);
    NumbSteps : INT := 0;
    Visibility : ARRAY[1..10] OF BOOL;
    ActiveIndex : INT := 1;
    AdressArr1 : ARRAY[1..3, 1..30] OF INT;
    AdressArr2 : ARRAY[1..3, 1..30] OF INT;
    AdressArr3 : ARRAY[1..3, 1..30] OF INT;
    AdressArr4 : ARRAY[1..3, 1..30] OF INT;
    AdressArr5 : ARRAY[1..3, 1..30] OF INT;
    AdressArr6 : ARRAY[1..3, 1..30] OF INT;
    AdressArr7 : ARRAY[1..3, 1..30] OF INT;
    AdressArr8 : ARRAY[1..3, 1..30] OF INT;
    Step_Up : INT;
    i_index : INT := 1;
    j_index : INT := 1;
    z_index : INT := 1;
    Arr_Item : ARRAY[1..3, 1..30] OF INT;
    VacuumON : BOOL := TRUE;
    VacuumOFF : BOOL := FALSE;
    N2ON : BOOL := TRUE;
    N2OFF : BOOL := FALSE;
    DataFillArr : ARRAY[1..8, 1..3, 1..30] OF INT;
    EBRButton : BOOL := 0;
    BSRButton : BOOL := 0;
    DepositButton : BOOL := 0;
    ButtonVisibility : ARRAY[1..3] OF BOOL;
    SolventType : INT;
    RecipName : STRING := '';
    ReciptComment : STRING := 'default';
    WaferSize : INT := 50;
    RotationType : INT := 0;
    RecipeName : STRING;
    Step : INT;
    StepType : INT;
    StepVar : ARRAY[1..8, 1..30] OF INT;
    Dummy : STRING;
    DummyI : INT;
END_VAR
```

*Opmerking: deze POU heeft een FBD‑implementatie (grafisch). Zie PLCopen XML hieronder.*

```xml
<ns0:FBD xmlns:html="http://www.w3.org/1999/xhtml" xmlns:ns0="http://www.plcopen.org/xml/tc6_0200">
                    <ns0:vendorElement localId="10000000000">
                      <ns0:position x="0" y="0" />
                      <ns0:alternativeText>
                        <html:xhtml>FBD Implementation Attributes</html:xhtml>
                      </ns0:alternativeText>
                      <ns0:addData>
                        <ns0:data name="http://www.3s-software.com/plcopenxml/fbd/implementationattributes" handleUnknown="implementation">
                          <fbdattributes>
                            <attribute name="BoxInputFlagsSupported" value="true" />
                          </fbdattributes>
                        </ns0:data>
                      </ns0:addData>
                    </ns0:vendorElement>
                  </ns0:FBD>
                
```


### Hardware  —  PROGRAM

```iecst
VAR
    StringApi : STRING;
    EthercatOperational : BOOL;
    FirstTimeOperational : BOOL;
    TimerEthercat : ULINT;
END_VAR
```

```iecst
hw.Cobot(sIpAddr := '192.168.122.30',iCobotNr := 1,sCobotName := '2',ToolList := pers.toollist, xEnable:= TRUE);
```


### HTTP_Client  —  PROGRAM

```iecst
VAR_INPUT
    Trigger : BOOL;
END_VAR
```

```iecst
VAR
    IP_PLC : NBS.IPv4Address;
    Port_PLC : UINT := 7000;
    IP_SPINNER : NBS.IPv4Address;
    Port_SPINNER : UINT := 47999;
END_VAR
```

```iecst

```


### ReadUInt32LE  —  FUNCTION

```iecst
VAR_INPUT
    pBuf : POINTER TO BYTE;
    udiIdx : UDINT;
END_VAR
```

```iecst
VAR
    p : POINTER TO BYTE;
    b0 : UDINT;
    b1 : UDINT;
    b2 : UDINT;
    b3 : UDINT;
    b : BYTE;
END_VAR
```

```iecst
p := pBuf; p := p + udiIdx;
b := p^; b0 := TO_UDINT(b); p := p + 1;
b := p^; b1 := TO_UDINT(b); p := p + 1;
b := p^; b2 := TO_UDINT(b); p := p + 1;
b := p^; b3 := TO_UDINT(b);
ReadUInt32LE := (b3 * 16#1000000) + (b2 * 16#10000) + (b1 * 16#100) + b0; 
RETURN;
```


### WriteFile  —  PROGRAM

```iecst
VAR
    strFileName : STRING := '';
    stFileHandle : SysFile.RTS_IEC_HANDLE;
    stResult : SysFile.RTS_IEC_RESULT;
    line : STRING := '0';
    pbyBuffer : POINTER TO BYTE := ADR(line);
    nSizeWritten : __XWORD;
    bIsWritten : BOOL;
    row : INT;
    col : INT;
END_VAR
```

```iecst
strFileName:='/mnt/sdcard/recipes';
strFileName:=CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(strFileName,'/'),VisuBlock.ReciptComment),'/'),VisuBlock.RecipName),'.csv');
IF NOT bIsWritten THEN
    //Open file
    stFileHandle := SysFileOpen(strFileName, SysFile.AM_WRITE, ADR(stResult));
    
    //Write file
    nSizeWritten := SysFileWrite(stFileHandle, pbyBuffer, TO___XWORD(LEN(line)), ADR(stResult));
    FOR row := 1 TO VisuBlock.NumbSteps DO
        line := ''; // Reset line for each row
        FOR col := 1 TO 30 DO
            line := CONCAT(line, TO_STRING(VisuBlock.StepVar[row, col]));
            IF col < 29 THEN
                line := CONCAT(line, ','); // Add comma between values
            END_IF
        END_FOR
        line := CONCAT(line, '$R$N'); // Add newline
        stResult := SysFileWrite(stFileHandle, ADR(line),TO___XWORD(LEN(line)), ADR(stResult));
    END_FOR
    //Close file
    stResult := SysFileClose(stFileHandle);
    
    IF nSizeWritten > 0 THEN
        bIsWritten := TRUE;
    END_IF

END_IF
```


### LoadFile  —  PROGRAM

```iecst
VAR
    stFileHandle : SysFile.RTS_IEC_HANDLE;
    strFileName : STRING := '/mnt/sdcard/recipes/Rudy/EBR_2inch1.csv';
    buffer : ARRAY[1..1023] OF BYTE;
    bytesRead : __XWORD;
    Counter : INT;
    FileContent : ARRAY[1..1023] OF STRING;
    stResult : SysFile.RTS_IEC_RESULT;
    c : INT;
    i : INT;
    rows : INT;
    j : INT;
    col : INT;
    lines : ARRAY[1..8] OF STRING;
    tempLine : STRING(255) := '';
    MainString : STRING;
    StartPos : INT;
    EndPos : INT;
    result : BOOL;
    ByteChar : STRING(1);
    BufPointer : POINTER TO BYTE;
END_VAR
```

```iecst
// Open the file for reading data into buffer
stFileHandle := SysFileOpen(strFileName, SysFile.AM_READ, ADR(stResult));
bytesRead:= SysFileRead(stFileHandle, ADR(buffer), SIZEOF(buffer), ADR(stResult));
SysFileClose(stFileHandle);

// convert data to string
IF bytesRead <= 32767 THEN
    Counter:= TO_INT(bytesRead);
    ELSE
        Counter:= 32767;
END_IF
FOR i:=1 TO Counter DO
    BufPointer:= ADR(ByteChar);
    BufPointer^:= buffer[i];
     
    FileContent[i]:= TO_STRING(ByteChar);
END_FOR
// make from the array one string
FOR i:=1 TO Counter DO
    MainString:= CONCAT(MainString,FileContent[i]);
END_FOR

// split the file in lines
rows:=1;
j:=1;
FOR j:=1 TO Counter DO
IF FileContent[j]='$R' THEN //Go to newline char
    lines[rows]:= tempLine;
    tempLine:= '';
    rows:=rows+1;
    j:= j+1;
    ELSE
    tempLine:= CONCAT(tempLine,FileContent[j]);    
    END_IF
END_FOR


// Fill the destination array by splitting rows on ',' -> col
StartPos:=1;
    j:= 1;
FOR i:= 1 TO 7 DO // to all except last row
j:= 1;
    WHILE FIND(lines[i], ',') > 1 DO // if ther is a ',' atleast on the second place
        EndPos:= FIND(lines[i], ','); // the position of the found ','
        tempLine:= MID(lines[i],EndPos-StartPos , StartPos); //Copy the Chars between start en end
        VisuBlock.StepVar[i,j]:= STRING_TO_INT(tempLine); //copy the concatened STRING TO INT in the first value of step 1
        lines[i]:= DELETE(lines[i], ENDPos, StartPos);    // Cut off the copied value from start string
        j:=j+1;
    END_WHILE
END_FOR
    // last line
    (*tempLine:= RIGHT(lines[i], LEN(lines[i])-StartPos+1);
    VisuBlock.StepVar[i,j]:= STRING_TO_INT(tempLine);*)
```


### ReadUInt16LE  —  FUNCTION

```iecst
VAR_INPUT
    pBuf : POINTER TO BYTE;
    udiIdx : UDINT;
END_VAR
```

```iecst
VAR
    p : POINTER TO BYTE;
    lo : UINT;
    hi : UINT;
    b : BYTE;
END_VAR
```

```iecst
p := pBuf; p := p + udiIdx;
b := p^; lo := TO_UINT(b);
p := p + 1; b := p^; hi := TO_UINT(b);
ReadUInt16LE := (hi * 256) + lo; 
RETURN;
```


### BuildSpinnerRequest  —  FUNCTION

```iecst
VAR_INPUT
    byCmd : CMD;
    byType : PTYP;
    pPayload : POINTER TO BYTE;
    udiPayloadLen : UDINT;
    pBySeqInOut : POINTER TO BYTE;
    pDst : POINTER TO BYTE;
    udiDstMax : UDINT;
END_VAR
```

```iecst
VAR
    idx : UDINT;
    q : POINTER TO BYTE;
    b : BYTE;
    i : UDINT;
    pd : POINTER TO BYTE;
    ps : POINTER TO BYTE;
END_VAR
```

```iecst
idx := 0;

// Minimale ruimte: header 8 bytes + payload
IF udiDstMax < (8 + udiPayloadLen) THEN
    BuildSpinnerRequest := 0;
    RETURN;
END_IF;

// MAGIC
idx := WriteUInt16LE(pDst, idx, Const.SPIN_MAGIC);

// VERSION
q := pDst; q := q + idx; q^ := Const.SPIN_VERSION; idx := idx + 1;

// SEQ
b := pBySeqInOut^;
q := pDst; q := q + idx; q^ := b; idx := idx + 1;

// CMD
b := TO_BYTE(byCmd);
q := pDst; q := q + idx; q^ := b; idx := idx + 1;

// PTYP
b := TO_BYTE(byType);
q := pDst; q := q + idx; q^ := b; idx := idx + 1;

// Payload length (1 byte)
b := TO_BYTE(udiPayloadLen);
q := pDst; q := q + idx; q^ := b; idx := idx + 1;

// Reserved (1 byte)
q := pDst; q := q + idx; q^ := 0; idx := idx + 1;

// PAYLOAD — Strict IEC COPY
IF (udiPayloadLen > 0) AND (pPayload <> 0) THEN
    pd := pDst; pd := pd + idx;   // write-pointer
    ps := pPayload;               // read-pointer
    i  := 0;
    WHILE i < udiPayloadLen DO
        pd^ := ps^;
        pd := pd + 1;
        ps := ps + 1;
        i := i + 1;
    END_WHILE;
    idx := idx + udiPayloadLen;
END_IF;

// Final size
BuildSpinnerRequest := idx;
RETURN;
```


### ParseSpinnerResponse  —  FUNCTION

```iecst
VAR_INPUT
    pBuf : POINTER TO BYTE;
    udiLen : UDINT;
    bySeqSent : BYTE;
END_VAR
```

```iecst
VAR_OUTPUT
    byCmd : CMD;
    byType : PTYP;
    udiPayLen : UDINT;
    pPay : POINTER TO BYTE;
END_VAR
```

```iecst
VAR
    tmpU16 : UINT;
    tmpB : BYTE;
    q : POINTER TO BYTE;
END_VAR
```

```iecst
IF udiLen < 8 THEN ParseSpinnerResponse := FALSE; RETURN; END_IF

// MAGIC
tmpU16 := ReadUInt16LE(pBuf, 0);
IF tmpU16 <> Const.SPIN_MAGIC THEN ParseSpinnerResponse := FALSE; RETURN; END_IF

// VERSION @ +2
q := pBuf; q := q + 2; tmpB := q^;
IF tmpB <> Const.SPIN_VERSION THEN ParseSpinnerResponse := FALSE; RETURN; END_IF

// SEQ @ +3
q := pBuf; q := q + 3; tmpB := q^;
IF tmpB <> bySeqSent THEN ParseSpinnerResponse := FALSE; RETURN; END_IF

// CMD @ +4
q := pBuf; q := q + 4; tmpB := q^; byCmd := tmpB;

// PTYP @ +5
q := pBuf; q := q + 5; tmpB := q^; byType := tmpB;

// LEN @ +6
q := pBuf; q := q + 6; tmpB := q^; udiPayLen := TO_UDINT(tmpB);

// length check
IF udiLen < (8 + udiPayLen) THEN ParseSpinnerResponse := FALSE; RETURN; END_IF

// payload pointer
pPay := pBuf; pPay := pPay + 8;

ParseSpinnerResponse := TRUE; 
RETURN;
```


### WriteUInt32LE  —  FUNCTION

```iecst
VAR_INPUT
    pBuf : POINTER TO BYTE;
    udiIdx : UDINT;
    udiValue : UDINT;
END_VAR
```

```iecst
VAR
    p : POINTER TO BYTE;
    b : BYTE;
END_VAR
```

```iecst
p := pBuf; p := p + udiIdx;
b := TO_BYTE(udiValue AND 16#FF); p^ := b; p := p + 1;
b := TO_BYTE(SHR(udiValue, 8) AND 16#FF); p^ := b; p := p + 1;
b := TO_BYTE(SHR(udiValue,16) AND 16#FF); p^ := b; p := p + 1;
b := TO_BYTE(SHR(udiValue,24) AND 16#FF); p^ := b;
WriteUInt32LE := udiIdx + 4; 
RETURN;
```


### WriteUInt16LE  —  FUNCTION

```iecst
VAR_INPUT
    pBuf : POINTER TO BYTE;
    udiIdx : UDINT;
    uiValue : UINT;
END_VAR
```

```iecst
VAR
    p : POINTER TO BYTE;
    b : BYTE;
END_VAR
```

```iecst
p := pBuf; p := p + udiIdx;
b := TO_BYTE(uiValue AND 16#00FF); p^ := b; p := p + 1;
b := TO_BYTE(SHR(uiValue, 8) AND 16#00FF); p^ := b;
WriteUInt16LE := udiIdx + 2; 
RETURN;
```


### Decode_STATcon_Full  —  FUNCTION

```iecst
VAR_INPUT
    pPay : POINTER TO BYTE;
    udiLen : UDINT;
END_VAR
```

```iecst
VAR_OUTPUT
    sta : STATCON_FULL;
END_VAR
```

```iecst
VAR
    tmpU16 : UINT;
    tmpU32 : UDINT;
    tmpB : BYTE;
    q : POINTER TO BYTE;
END_VAR
```

```iecst
// Alles leegmaken
MEMSET(ADR(sta), 0, SIZEOF(sta));

// Minimale lengte STATcon = 89 bytes
IF udiLen < 89 THEN
    Decode_STATcon_Full := FALSE;
    RETURN;
END_IF

// -------------------
//  SPINDLE
// -------------------

tmpU32 := ReadUInt32LE(pPay, 0);   sta.spindle.pos     := TO_DINT(tmpU32);
tmpU32 := ReadUInt32LE(pPay, 4);   sta.spindle.err_flg := tmpU32;
tmpU16 := ReadUInt16LE(pPay, 8);   sta.spindle.vel_rpm := TO_INT(tmpU16);

q := pPay; q := q + 10; tmpB := q^; sta.spindle.mode    := tmpB;
q := pPay; q := q + 11; tmpB := q^; sta.spindle.home_st := tmpB;
q := pPay; q := q + 12; tmpB := q^; sta.spindle.dlyEC   := tmpB;

// -------------------
//  STEPPER 0
// -------------------

sta.stepper[0].pos       := TO_DINT(ReadUInt32LE(pPay,16));
sta.stepper[0].capt_pos  := TO_DINT(ReadUInt32LE(pPay,20));
sta.stepper[0].err_flg   := ReadUInt32LE(pPay,24);
sta.stepper[0].vel_incrs := TO_DINT(ReadUInt32LE(pPay,28));
q := pPay; q := q + 32; tmpB := q^; sta.stepper[0].mode     := tmpB;
q := pPay; q := q + 33; tmpB := q^; sta.stepper[0].capt_evt := tmpB;

// -------------------
//  STEPPER 1
// -------------------

sta.stepper[1].pos       := TO_DINT(ReadUInt32LE(pPay,36));
sta.stepper[1].capt_pos  := TO_DINT(ReadUInt32LE(pPay,40));
sta.stepper[1].err_flg   := ReadUInt32LE(pPay,44);
sta.stepper[1].vel_incrs := TO_DINT(ReadUInt32LE(pPay,48));
q := pPay; q := q + 52; tmpB := q^; sta.stepper[1].mode     := tmpB;
q := pPay; q := q + 53; tmpB := q^; sta.stepper[1].capt_evt := tmpB;

// -------------------
//  STEPPER 2
// -------------------

sta.stepper[2].pos       := TO_DINT(ReadUInt32LE(pPay,56));
sta.stepper[2].capt_pos  := TO_DINT(ReadUInt32LE(pPay,60));
sta.stepper[2].err_flg   := ReadUInt32LE(pPay,64);
sta.stepper[2].vel_incrs := TO_DINT(ReadUInt32LE(pPay,68));
q := pPay; q := q + 72; tmpB := q^; sta.stepper[2].mode     := tmpB;
q := pPay; q := q + 73; tmpB := q^; sta.stepper[2].capt_evt := tmpB;

// -------------------
//  IO
// -------------------

sta.io.din_bits  := ReadUInt32LE(pPay,76);
sta.io.vac_kPa   := TO_INT(ReadUInt16LE(pPay,80));
sta.io.Uin_V     := TO_INT(ReadUInt16LE(pPay,82));
sta.io.dout_bits := ReadUInt32LE(pPay,84);
q := pPay; q := q + 88; tmpB := q^; sta.io.vac_state := tmpB;

// -------------------------
//  OPTIONAL: DP_DAC (98+)
// -------------------------

IF udiLen >= 98 THEN
    sta.aout_DP_DAC[0] := ReadUInt16LE(pPay, 92);
    sta.aout_DP_DAC[1] := ReadUInt16LE(pPay, 94);
    sta.aout_DP_DAC[2] := ReadUInt16LE(pPay, 96);
    sta.hasDP_DAC := TRUE;
END_IF;

// -------------------------
//  OPTIONAL: StopConds (104+)
// -------------------------

IF udiLen >= 104 THEN
    sta.stopConds := ReadUInt32LE(pPay, 100);
    sta.hasStopConds := TRUE;
END_IF;

Decode_STATcon_Full := TRUE;
RETURN;
```


### TCP_Client  —  PROGRAM

```iecst
VAR_INPUT
    Enable : BOOL;
    ServerIP : NBS.IPv4Address;
    ServerPort : UINT := 7070;
    Timeout : UDINT := 1000;
    SendDataBuf : ARRAY[0..255] OF BYTE;
    RecieveDataBuf : ARRAY[0..255] OF BYTE;
END_VAR
```

```iecst
VAR
    DTG_TcpClient : NBS.TCP_Client;
    DTG_TcpWrite : NBS.TCP_Write;
    DTG_TcpRead : NBS.TCP_Read;
END_VAR
```

```iecst

```


### FB_UdpSrvCl  —  FUNCTIONBLOCK

```iecst
VAR_INPUT
    xEnable : BOOL;
    xSendTrig : BOOL := HTTP_Client.Trigger;
    sLocalIp : NBS.IPv4Address;
    uiLocalPort : UINT := HTTP_Client.Port_PLC;
    sRemoteIp : NBS.IPv4Address;
    uiRemotePort : UINT := HTTP_Client.Port_SPINNER;
    pSendData : POINTER TO BYTE := ADR(HTTP_Client.UDP_SendBuffer);
    udiSendSize : UDINT;
END_VAR
```

```iecst
VAR_OUTPUT
    xActive : BOOL;
    xBusy : BOOL;
    xError : BOOL;
    eErrorID : DINT;
    xNewData : BOOL;
    udiRecvCount : UDINT;
    uiFromPort : UINT;
END_VAR
```

```iecst
VAR
    Peer : NBS.UDP_peer := HTTP_Client.UdpProducer;
    Sender : NBS.UDP_send := HTTP_Client.UdpSend;
    Receiver : NBS.UDP_Receive := HTTP_Client.UdpReceive;
    abyRx : ARRAY[0..511] OF BYTE := HTTP_Client.UDP_SendBuffer;
    _sendLatch : BOOL;
END_VAR
```

```iecst
// Bind / activate peer
// -----------------------------------------------------------------------------
Peer(
    xEnable    := xEnable,
    itfIPAddress := sLocalIP,
    uiPort     := uiLocalPort,
    itfMulticast := 0
);

xActive := Peer.xActive;

// -----------------------------------------------------------------------------
// SEND logic
// -----------------------------------------------------------------------------
IF xSendTrig AND NOT _sendLatch THEN
    // Rising edge → send data
   Sender(
        xExecute     := TRUE,
        itfIPAddress    := sRemoteIp,
        uiPort       := uiRemotePort,
        itfPeer      := Peer,
        pData        := pSendData,
        udiSize      := udiSendSize,
        udiTimeout     := 500
    );
    _sendLatch := TRUE;
ELSE
    // Maintain execution high for one cycle, then drop
    Sender(
        itfIPAddress    := sRemoteIp,
        uiPort       := uiRemotePort,
        itfPeer      := Peer,
        pData        := pSendData,
        udiSize      := udiSendSize,
        udiTimeout     := 500
    );
END_IF

IF NOT xSendTrig THEN
    _sendLatch := FALSE;
END_IF

// -----------------------------------------------------------------------------
// RECEIVE logic
// Always enabled. Non-blocking.
// -----------------------------------------------------------------------------
Receiver(
    xEnable        := xEnable,
    pData          := ADR(abyRx),
    udiSize        := SIZEOF(abyRx),
    itfPeer        := Peer
);

// -----------------------------------------------------------------------------
// Collect outputs
// -----------------------------------------------------------------------------
xBusy        := Sender.xBusy OR Receiver.xBusy OR Peer.xBusy;
xError       := Sender.xError OR Receiver.xError OR Peer.xError;

IF Sender.xError THEN eErrorID := Sender.eErrorID; END_IF
IF Receiver.xError THEN eErrorID := Receiver.eErrorID; END_IF
IF Peer.xError THEN eErrorID := Peer.eErrorID; END_IF

// Handle incoming packet
xNewData     := Receiver.xReady;
udiRecvCount := Receiver.udiCount;
uiFromPort   := Receiver.uiPortFrom;
```


**Method: CopyRx**

- Return type: `UDINT`

```iecst
VAR_INPUT
    pDst : POINTER TO BYTE;
    udiMax : UDINT;
END_VAR
```

```iecst
VAR
    i : UDINT;
END_VAR
```

```iecst
IF NOT xNewData THEN
    CopyRx := 0;
    RETURN;
END_IF

IF udiRecvCount > udiMax THEN
    i := udiMax;
ELSE
    i := udiRecvCount;
END_IF

MEMCPY(pDst, ADR(abyRx), i);
CopyRx := i;
```


### FB_PolosClient  —  FUNCTIONBLOCK

```iecst
VAR_OUTPUT
    xActive : BOOL;
    xBusy : BOOL;
    xError : BOOL;
    sLastError : STRING(120);
    LastCmd : CMD;
    LastAck : BOOL;
    LastNack : BOOL;
    LastNackCode : BYTE;
    Stat : STATCON_FULL;
    EarlyBusy : BOOL;
END_VAR
```

```iecst
VAR
    aTx : ARRAY[0..255] OF BYTE;
    aRx : ARRAY[0..255] OF BYTE;
    udiTxLen : UDINT;
    udiRxLen : UDINT;
    eSm : Implicit_Enum__FB_PolosClient__eSm;
    bySeq : BYTE := 1;
    tResp : TON;
    toClass : TIME := Const.TO_CLASS_20MS;
    nRetry : UINT;
    curCmd : CMD;
    curTyp : PTYP;
    curPayLen : UDINT;
    curPay : ARRAY[0..127] OF BYTE;
    _EarlyBusy : BOOL;
    _ok : BOOL;
    _rCmd : CMD;
    _rType : PTYP;
    _payLen : UDINT;
    _pPay : POINTER TO BYTE;
    _ptr : POINTER TO BYTE;
    i : UDINT;
    tmpB : BYTE;
    tmpB0 : BYTE;
    tmpB1 : BYTE;
END_VAR
```

```iecst
(************************************)
(* Early-ACK / Busy reflectie       *)
(************************************)
_EarlyBusy := (Stat.spindle.dlyEC = Const.DLYEC_BUSY);
EarlyBusy  := _EarlyBusy;

(************************************)
(*            STATE MACHINE         *)
(************************************)

CASE eSm OF

// ----------------------------------
SM_IDLE:
    xBusy := FALSE;

// ----------------------------------
SM_SEND:

    // TX-lengte moet passen in externe UDP buffer (33 bytes voor SendMessage[])
    IF udiTxLen > 33 THEN
        sLastError := 'TX length > 33 bytes';
        eSm := SM_ERR;
    ELSE
        // For-loop kopie naar GVL_UDP_IO.UDP_SendBuffer
        FOR i := 0 TO udiTxLen - 1 DO
            GVL_UDP_IO.UDP_SendBuffer[i] := aTx[i];
        END_FOR;

        GVL_UDP_IO.UDP_SendLength := udiTxLen;
        GVL_UDP_IO.UDP_TriggerSend := TRUE;   // één scan hoog in PROGRAM HTTP_Client

        tResp(IN := TRUE, PT := toClass);
        xBusy := TRUE;
        eSm   := SM_WAIT;
    END_IF;

// ----------------------------------
SM_WAIT:
    xBusy := TRUE;

    IF GVL_UDP_IO.UDP_NewData THEN
        GVL_UDP_IO.UDP_NewData := FALSE;
        udiRxLen := GVL_UDP_IO.UDP_RecvLength;

        IF udiRxLen > 256 THEN
            udiRxLen := 256;
        END_IF;

        // RX kopiëren via FOR-loop
        FOR i := 0 TO udiRxLen - 1 DO
            aRx[i] := GVL_UDP_IO.UDP_RecvBuffer[i];
        END_FOR;

        tResp(IN := FALSE);
        eSm := SM_PARSE;

    ELSIF tResp.Q THEN
        tResp(IN := FALSE);

        nRetry := nRetry + 1;

        IF nRetry >= Const.RETRY_MAX THEN
            sLastError := 'Timeout';
            eSm := SM_ERR;
        ELSE
            tResp(IN := TRUE, PT := toClass);
            eSm := SM_SEND;
        END_IF;
    END_IF;

// ----------------------------------
SM_PARSE:

    _ok := ParseSpinnerResponse(
                pBuf := ADR(aRx),
                udiLen := udiRxLen,
                bySeqSent := bySeq,
                byCmd => _rCmd,
                byType => _rType,
                udiPayLen => _payLen,
                pPay => _pPay );

    IF NOT _ok THEN
        sLastError := 'Parse failed';
        eSm := SM_ERR;

    ELSE
        LastAck := FALSE;
        LastNack := FALSE;
        LastNackCode := 0;

        CASE curCmd OF

        // ---------------- STATreq --------------------
        CMD.STATreq:
            IF (_rCmd = CMD.STATcon) AND (_rType = PTYP.STATcon) THEN
                _ok := Decode_STATcon_Full(
                        pPay := _pPay,
                        udiLen := _payLen,
                        sta => Stat );

                IF _ok THEN
                    LastCmd := curCmd;
                    LastAck := TRUE;
                    eSm := SM_IDLE;
                ELSE
                    sLastError := 'STAT decode';
                    eSm := SM_ERR;
                END_IF;

            ELSIF (_rCmd = CMD.NACKcon) THEN
                LastCmd := curCmd;
                LastNack := TRUE;

                _ptr := _pPay;
                _ptr := _ptr + 1;
                LastNackCode := _ptr^;

                eSm := SM_IDLE;
            END_IF;

        // ----------- ACK/NACK voor alle andere cmds ----------
        CMD.WDENAreq, CMD.WDTRIGreq, CMD.SETOUTreq, CMD.PWRVALreq,
        CMD.VELreq, CMD.PUDDLEreq, CMD.POSreq, CMD.STOPreq, CMD.OFFreq,
        CMD.INITreq,
        CMD.S1_VELreq, CMD.S2_VELreq, CMD.S3_VELreq,
        CMD.S1_POSreq, CMD.S2_POSreq, CMD.S3_POSreq,
        CMD.S1_STOPreq, CMD.S2_STOPreq, CMD.S3_STOPreq,
        CMD.S1_OFFreq,  CMD.S2_OFFreq,  CMD.S3_OFFreq:

            // ACK
            IF (_rCmd = CMD.ACKcon) AND (_pPay^ = curCmd) THEN
                LastCmd := curCmd;
                LastAck := TRUE;
                eSm := SM_IDLE;

            // NACK
            ELSIF (_rCmd = CMD.NACKcon) AND (_pPay^ = curCmd) THEN
                LastCmd := curCmd;
                LastNack := TRUE;
                _ptr := _pPay;
                _ptr := _ptr + 1;
                LastNackCode := _ptr^;
                eSm := SM_IDLE;
            END_IF;
            
                // ---- GENERIEKE ACK/NACK FALLBACK ----
                IF _rCmd = CMD.ACKcon THEN
                    // eerste payloadbyte = ge-ACK-te command-ID
                    
                    tmpB := _pPay^;
                        LastCmd := tmpB;            // enum krijgt de onderliggende byte
                    LastAck := TRUE;
                    eSm := SM_IDLE;

                ELSIF _rCmd = CMD.NACKcon THEN
                    
                tmpB0 := _pPay^;            // cmd-id
                LastCmd := tmpB0;
                // Een NACK heeft ten minste 2 payloadbytes: [cmd-id][ecode]
                   _ptr := _pPay; _ptr := _ptr + 1; tmpB1 := _ptr^;
                   LastNack := TRUE; LastNackCode := tmpB1;
                eSm := SM_IDLE;

ELSE
    // niets doen, laat "Unhandled" zijn werk doen of jouw bestaande pad
END_IF

        ELSE
            sLastError := 'Unhandled CMD';
            eSm := SM_ERR;
        END_CASE
    END_IF;

// ----------------------------------
SM_ERR:
    xBusy := FALSE;
    eSm := SM_IDLE;

END_CASE;
```


**Method: _ResetRespFlags**

```iecst
LastAck:=FALSE; LastNack:=FALSE; LastNackCode:=0;

// _TryAccept
// Purpose : Validate that a request can start (SM idle, early-ACK rules), build
//           the frame and hand it to the UDP wrapper.
// Inputs  : cmd, ptyp, pPay/payLen, toClass (timeout class)
// Returns : TRUE if accepted (transmission started)
```


**Method: _TryAccept**

- Return type: `BOOL`

```iecst
VAR_INPUT
    cmd : CMD;
    ptyp : PTYP;
    pPay : POINTER TO BYTE;
    payLen : UDINT;
    toClass : TIME;
END_VAR
```

```iecst
VAR
    j : UDINT;
    CMD_STATREQ : BYTE := 16#43;
END_VAR
```

```iecst
// Early-ACK blocking


IF _EarlyBusy THEN
    IF (TO_BYTE(cmd) <> 16#43) AND (TO_BYTE(cmd) <> 16#40) THEN
        _TryAccept := FALSE;
        RETURN;
    END_IF
END_IF



IF eSm <> SM_IDLE THEN
    _TryAccept := FALSE;
    RETURN;
END_IF;

// Sequence verhogen
IF bySeq = 255 THEN
    bySeq := 1;
ELSE
    bySeq := bySeq + 1;
END_IF;

// Payload kopiëren in lokale buffer
IF (payLen > 0) AND (pPay <> 0) THEN
    FOR j := 0 TO payLen - 1 DO
        curPay[j] := pPay^;      // pointer read
        pPay := pPay + 1;        // pointer increment
    END_FOR;
END_IF;

curCmd    := cmd;
curTyp    := ptyp;
curPayLen := payLen;
toClass   := toClass;

// Frame bouwen
udiTxLen := BuildSpinnerRequest(
                byCmd := curCmd,
                byType := curTyp,
                pPayload := ADR(curPay),
                udiPayloadLen := curPayLen,
                pBySeqInOut := ADR(bySeq),
                pDst := ADR(aTx),
                udiDstMax := TO_UDINT(SIZEOF(aTx)) );

IF udiTxLen = 0 THEN
    _TryAccept := FALSE;
    RETURN;
END_IF;

_ResetRespFlags();
nRetry := 0;

eSm := SM_SEND;
xBusy := TRUE;

_TryAccept := TRUE;
RETURN;
```


**Method: DoSTAT**

- Return type: `BOOL`

```iecst
DoSTAT := _TryAccept(CMD.STATreq, PTYP.NONE, ADR(curPay), 0, Const.TO_CLASS_20MS);
RETURN;
```


**Method: DoStop**

- Return type: `BOOL`

```iecst
DoSTOP := _TryAccept(CMD.STOPreq, PTYP.NONE, ADR(curPay), 0, Const.TO_CLASS_1S);
RETURN;
```


**Method: DoOFF**

- Return type: `BOOL`

```iecst
DoOFF := _TryAccept(CMD.OFFreq, PTYP.NONE, ADR(curPay), 0, Const.TO_CLASS_10S);
RETURN;
```


**Method: DoWDENA**

- Return type: `BOOL`

```iecst
VAR_INPUT
    iEnable : INT;
END_VAR
```

```iecst
VAR
    pay : ARRAY[0..1] OF BYTE;
END_VAR
```

```iecst
pay[0] := TO_BYTE(TO_UINT(iEnable) AND 16#FF);
pay[1] := TO_BYTE(SHR(TO_UINT(iEnable),8));

DoWDENA := _TryAccept(
    CMD.WDENAreq,
    PTYP._1xINT16_DEC,
    ADR(pay),
    2,
    Const.TO_CLASS_20MS
);

RETURN;
```


**Method: DoWDTRIG**

- Return type: `BOOL`

```iecst
DoWDTRIG := _TryAccept(CMD.WDTRIGreq, PTYP.NONE, ADR(curPay), 0, Const.TO_CLASS_20MS);
RETURN;
```


**Method: DoPRDVAL**

- Return type: `BOOL`

```iecst
VAR_INPUT
    pid : UINT;
    idx : UDINT;
END_VAR
```

```iecst
VAR
    pay : ARRAY[0..7] OF BYTE;
    len : UDINT;
END_VAR
```

```iecst
len := MakePayload_PRDVALreq(ADR(pay), SIZEOF(pay), pid, idx);
DoPRDVAL := _TryAccept(CMD.PRDVALreq, PTYP._2xUINT32_DEC, ADR(pay), len, Const.TO_CLASS_20MS);
RETURN;
```


**Method: DoPWRVAL_U32**

- Return type: `BOOL`

```iecst
VAR_INPUT
    pid : UINT;
    idx : UDINT;
    value : UDINT;
END_VAR
```

```iecst
VAR
    pay : ARRAY[0..31] OF BYTE;
    len : UDINT;
END_VAR
```

```iecst
len := MakePayload_PWRVALreq(ADR(pay), SIZEOF(pay), pid, 16#04, idx, ADR(value), 4);
DoPWRVAL_U32 := _TryAccept(CMD.PWRVALreq, PTYP.PWRVALreq, ADR(pay), len, Const.TO_CLASS_20MS);
RETURN;
```


**Method: DoINIT**

- Return type: `BOOL`

```iecst
DoINIT := _TryAccept(
    CMD.INITreq,        // 0x40
    PTYP.NONE,          // 0x01
    ADR(curPay),        // geen payload
    0,                  // lengte = 0 bytes
    Const.TO_CLASS_1S   // INIT-timeout = 1 seconde
);
RETURN;
```


### DecodeStopConds  —  FUNCTION

```iecst
VAR_INPUT
    u : UDINT;
END_VAR
```

```iecst
VAR
    ra : STOPCONDS_REC;
END_VAR
```

```iecst
Ra.UVOLT   := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.UVOLT  )) <> 0;
ra.OVOLT   := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.OVOLT  )) <> 0;
ra.OVRLD   := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.OVRLD  )) <> 0;
ra.SENSORS := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.SENSORS)) <> 0;
ra.UNLOCK  := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.UNLOCK )) <> 0;
ra.SW_WD   := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.SW_WD  )) <> 0;
ra.VLIMIT  := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.VLIMIT )) <> 0;
ra.LID_OPEN:= (u AND SHL(TO_UDINT(1), STOPCOND_BIT.LID_OPEN)) <> 0;
ra.NO_VAC  := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.NO_VAC )) <> 0;
ra.HW_FAULT:= (u AND SHL(TO_UDINT(1), STOPCOND_BIT.HW_FAULT)) <> 0;
ra.LIM_SW  := (u AND SHL(TO_UDINT(1), STOPCOND_BIT.LIM_SW )) <> 0;
DecodeStopConds := ra;
RETURN;
```


### MakePayload_PRDVALreq  —  FUNCTION

```iecst
VAR_INPUT
    pDst : POINTER TO BYTE;
    udiMax : UDINT;
    pid : UINT;
    idxReq : UDINT;
END_VAR
```

```iecst
VAR
    i : UDINT;
    tmpUD : UDINT;
END_VAR
```

```iecst
i := 0;
IF udiMax < 8 THEN
    MakePayload_PRDVALreq := 0;
    RETURN;
END_IF;

// PID (LE 32-bit)
tmpUD := TO_UDINT(pid);
i := WriteUInt32LE(pDst, i, tmpUD);

// IDX (LE 32-bit)
i := WriteUInt32LE(pDst, i, idxReq);

MakePayload_PRDVALreq := i;
RETURN;
```


### MakePayload_PWRVALreq  —  FUNCTION

```iecst
VAR_INPUT
    pDst : POINTER TO BYTE;
    udiMax : UDINT;
    pid : UINT;
    ptypeVal : BYTE;
    idxReq : UDINT;
    pValue : POINTER TO BYTE;
    udiSize : UDINT;
END_VAR
```

```iecst
VAR
    i : UDINT;
    tgt : UDINT;
    pad : UDINT;
    pd : POINTER TO BYTE;
    pv : POINTER TO BYTE;
END_VAR
```

```iecst
// Minimale payloadlengte:
tgt := 16 + udiSize;
IF tgt < 24 THEN tgt := 24; END_IF;

IF udiMax < tgt THEN
    MakePayload_PWRVALreq := 0;
    RETURN;
END_IF;

i := 0;

// PID: UINT16 LE
i := WriteUInt16LE(pDst, i, pid);

// PTYP
pd := pDst; pd := pd + i;
pd^ := ptypeVal;
i := i + 1;

// ALIGN (1 byte)
pd := pDst; pd := pd + i;
pd^ := 0;
i := i + 1;

// IDX (UDINT LE)
i := WriteUInt32LE(pDst, i, idxReq);

// VALUE via FOR-loop
IF (udiSize > 0) AND (pValue <> 0) THEN
    pd := pDst; pd := pd + i;
    pv := pValue;
    pad := 0;
    WHILE pad < udiSize DO
        pd^ := pv^;
        pd := pd + 1;
        pv := pv + 1;
        pad := pad + 1;
    END_WHILE;
    i := i + udiSize;
END_IF;

// PADDING
IF i < tgt THEN
    pad := tgt - i;
    pd := pDst; pd := pd + i;
    WHILE pad > 0 DO
        pd^ := 0;
        pd := pd + 1;
        pad := pad - 1;
    END_WHILE;
    i := tgt;
END_IF;

MakePayload_PWRVALreq := i;
RETURN;
```
