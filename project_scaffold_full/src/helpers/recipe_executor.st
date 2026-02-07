
(******************************************************************)
(*  FB_RecipeExecutor – eenvoudige sequentie‑executor             *)
(******************************************************************)
FUNCTION_BLOCK FB_RecipeExecutor
VAR_INPUT
    Start     : BOOL;
    Stop      : BOOL;
    Rcp       : RECIPE;   // zie docs/recipe_spec.md
    Allow     : BOOL;     // van interlock engine
END_VAR
VAR_OUTPUT
    Busy      : BOOL;
    Error     : BOOL;
    StepIdx   : UINT;
    Msg       : STRING(120);
END_VAR
VAR
    st : (IDLE, RUN, HOLD, DONE, ABORT);
    t  : TON;
END_VAR

CASE st OF
IDLE:
    IF Start AND Allow AND (Rcp.Count > 0) THEN
        StepIdx := 1; Busy := TRUE; Error := FALSE; Msg := '';
        st := RUN;
    END_IF;
RUN:
    // TODO: dispatch naar devices aan de hand van Rcp.Steps[StepIdx]
    // Placeholder: wacht HoldMs en ga door
    t(IN:=TRUE, PT:=T#100MS);
    IF t.Q THEN
        t(IN:=FALSE); StepIdx := StepIdx + 1;
        IF StepIdx > Rcp.Count THEN st := DONE; END_IF;
    END_IF;
DONE:
    Busy:=FALSE; Msg:='Recipe klaar';
    IF Stop THEN st := IDLE; END_IF;
ABORT:
    Busy:=FALSE; Error:=TRUE; Msg:='Afgebroken';
    IF Stop THEN st := IDLE; END_IF;
END_CASE
