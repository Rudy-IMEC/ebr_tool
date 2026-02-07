
(******************************************************************)
(*  Lightweight logger using pers.WarningLog[] ringbuffer         *)
(******************************************************************)
FUNCTION DTG_LogLine : BOOL
VAR_INPUT sLine : STRING; END_VAR
VAR idx : INT; END_VAR
idx := pers.WloggingCounter MOD 300;
pers.WarningLog[idx] := sLine;
pers.WloggingCounter := pers.WloggingCounter + 1;
DTG_LogLine := TRUE;

FUNCTION DTG_NibHex : STRING(1)
VAR_INPUT nib : BYTE; END_VAR
CASE TO_INT(nib) OF
 0: DTG_NibHex:='0'; 1:'1'; 2:'2'; 3:'3'; 4:'4'; 5:'5'; 6:'6'; 7:'7';
 8: '8'; 9:'9'; 10:'A'; 11:'B'; 12:'C'; 13:'D'; 14:'E'; 15:'F';
ELSE DTG_NibHex:='?'; END_CASE

FUNCTION DTG_LogHex : BOOL
VAR_INPUT pBuf: POINTER TO BYTE; udiLen: UDINT; sTitle: STRING; END_VAR
VAR i, maxN: UDINT; b,hi,lo: BYTE; p: POINTER TO BYTE; sLine: STRING(255); END_VAR
sLine := CONCAT(sTitle, ': '); p := pBuf; maxN := 32; IF udiLen < maxN THEN maxN := udiLen; END_IF;
FOR i:=0 TO maxN-1 DO
 b := p^; hi := SHR(b,4) AND 16#0F; lo := b AND 16#0F;
 sLine := CONCAT(sLine, DTG_NibHex(hi)); sLine := CONCAT(sLine, DTG_NibHex(lo));
 IF i < (maxN-1) THEN sLine := CONCAT(sLine,' '); END_IF; p := p + 1;
END_FOR;
DTG_LogLine(sLine); DTG_LogHex := TRUE;
