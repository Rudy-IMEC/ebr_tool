
TYPE STATCON_SPINDLE : STRUCT
    pos    : DINT;   // 8..11 int32
    err_flg: DWORD;  // 12..15 uint32
    vel_rpm: INT;    // 16..17 int16 (rpm)
    mode   : BYTE;   // 18
    home_st: BYTE;   // 19
    dlyEC  : BYTE;   // 20
END_STRUCT;

TYPE STATCON_IO : STRUCT
    din_bits   : DWORD; // 84..87
    vac_kPa    : INT;   // 88..89
    Uin_V      : INT;   // 90..91
    dout_bits  : DWORD; // 92..95
    vac_state  : BYTE;  // 96
END_STRUCT;
END_TYPE
