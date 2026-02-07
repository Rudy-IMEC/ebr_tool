
TYPE CMD : (
    // Spindle/generic
    VELreq := 16#01,
    STOPreq := 16#03,
    OFFreq := 16#04,
    PRDVALreq := 16#05,
    PUDDLEreq := 16#06,
    HM_REFreq := 16#07,
    HM_STOPreq := 16#08,
    POSreq := 16#09, // let op overlap met HM_POSreq in document
    INITreq := 16#40,
    PRDDESCreq := 16#41,
    PWRVALreq := 16#42,
    STATreq := 16#43,
    WDENAreq := 16#45,
    WDTRIGreq := 16#46,
    SETOUTreq := 16#47,
    LDISPreq := 16#48,

    // Steppers (1..3)
    S1_VELreq := 16#11, S2_VELreq := 16#21, S3_VELreq := 16#31,
    S1_POSreq := 16#12, S2_POSreq := 16#22, S3_POSreq := 16#32,
    S1_STOPreq := 16#13, S2_STOPreq := 16#23, S3_STOPreq := 16#33,
    S1_OFFreq := 16#14,  S2_OFFreq := 16#24,  S3_OFFreq := 16#34,

    // Confirms
    ACKcon := 16#81,
    NACKcon := 16#82,
    PRDDESCcon := 16#C1,
    PRDVALcon := 16#85,
    STATcon := 16#C3
) END_TYPE;
