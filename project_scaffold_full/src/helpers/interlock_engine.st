
(******************************************************************)
(*  FB_InterlockEngine – centrale regels                           *)
(******************************************************************)
FUNCTION_BLOCK FB_InterlockEngine
VAR_INPUT
    LID_ClosedLocked : BOOL;
    VAC_Ok           : BOOL;
    EtherCAT_Up      : BOOL;
    Spn_Mode         : BYTE;   // STATcon.spindle.mode
    Spn_dlyEC        : BYTE;   // STATcon.spindle.dlyEC
    StopCond         : DWORD;  // STATcon.err_flg of actuele StopConditions
    Cobot_Ready      : BOOL;
END_VAR
VAR_OUTPUT
    AllowMotion  : BOOL;
    BlockReason  : UINT;   // code voor HMI
END_VAR
VAR
    busy : BOOL;
END_VAR

// Eenvoudige regelset (MVP) – uitbreiden naar behoefte
AllowMotion := TRUE; BlockReason := 0;
IF NOT EtherCAT_Up THEN AllowMotion:=FALSE; BlockReason:=100; END_IF;
IF NOT LID_ClosedLocked THEN AllowMotion:=FALSE; BlockReason:=101; END_IF;
IF NOT VAC_Ok THEN AllowMotion:=FALSE; BlockReason:=102; END_IF;
IF (Spn_Mode = 16#0A) THEN AllowMotion:=FALSE; BlockReason:=103; END_IF; // PSTOP
IF (Spn_dlyEC = 16#16) THEN AllowMotion:=FALSE; BlockReason:=104; END_IF; // BUSY
IF NOT Cobot_Ready THEN AllowMotion:=FALSE; BlockReason:=105; END_IF;
// voorbeeld StopCondition maskers (UVOLT bit2, OVOLT bit3, OVRLD bit5, LID_OPEN bit13)
IF (StopCond AND 16#0000000C) <> 0 THEN AllowMotion:=FALSE; BlockReason:=201; END_IF; // UV/OV
IF (StopCond AND 16#00000020) <> 0 THEN AllowMotion:=FALSE; BlockReason:=202; END_IF; // OVRLD
IF (StopCond AND 16#00002000) <> 0 THEN AllowMotion:=FALSE; BlockReason:=203; END_IF; // LID_OPEN
