
(******************************************************************)
(*  Little-Endian helpers for spinIF frames                        *)
(******************************************************************)
FUNCTION WriteUInt16LE : UDINT
VAR_INPUT pDst : POINTER TO BYTE;  val : UINT; END_VAR
pDst^ := BYTE(val AND 16#00FF); pDst := pDst + 1;
pDst^ := BYTE(SHR(val,8) AND 16#00FF);
WriteUInt16LE := 2;

FUNCTION WriteInt16LE : UDINT
VAR_INPUT pDst : POINTER TO BYTE;  val : INT; END_VAR
WriteUInt16LE(pDst:=pDst, val:=TO_UINT(val));
WriteInt16LE := 2;

FUNCTION WriteUInt32LE : UDINT
VAR_INPUT pDst : POINTER TO BYTE;  val : UDINT; END_VAR
pDst^ := BYTE(val AND 16#FF);      pDst := pDst + 1;
pDst^ := BYTE(SHR(val,8) AND 16#FF); pDst := pDst + 1;
pDst^ := BYTE(SHR(val,16) AND 16#FF); pDst := pDst + 1;
pDst^ := BYTE(SHR(val,24) AND 16#FF);
WriteUInt32LE := 4;

FUNCTION WriteInt32LE : UDINT
VAR_INPUT pDst : POINTER TO BYTE;  val : DINT; END_VAR
WriteUInt32LE(pDst:=pDst, val:=TO_UDINT(val));
WriteInt32LE := 4;

FUNCTION ReadUInt16LE : UINT
VAR_INPUT pSrc : POINTER TO BYTE; END_VAR
VAR b0,b1: UINT; p: POINTER TO BYTE; END_VAR
p := pSrc; b0 := p^; p := p + 1; b1 := p^; ReadUInt16LE := UINT(b0 OR SHL(b1,8));

FUNCTION ReadInt16LE : INT
VAR_INPUT pSrc : POINTER TO BYTE; END_VAR
ReadInt16LE := TO_INT(ReadUInt16LE(pSrc));

FUNCTION ReadUInt32LE : UDINT
VAR_INPUT pSrc : POINTER TO BYTE; END_VAR
VAR b0,b1,b2,b3: UDINT; p: POINTER TO BYTE; END_VAR
p := pSrc; b0 := p^; p := p + 1; b1 := p^; p := p + 1; b2 := p^; p := p + 1; b3 := p^;
ReadUInt32LE := b0 OR SHL(b1,8) OR SHL(b2,16) OR SHL(b3,24);

FUNCTION ReadInt32LE : DINT
VAR_INPUT pSrc : POINTER TO BYTE; END_VAR
ReadInt32LE := TO_DINT(ReadUInt32LE(pSrc));
