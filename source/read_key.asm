;Gives me the key value of the key pressed

.nolist
#include "ti84pcse.inc"
#include "dcse8.inc"
#define    ProgStart  userMem-2
.list
.org    ProgStart
.db tExtTok,tAsm84CCmp
    call ClearLCDFull ; Clear Screen
    
    LD  HL, 0			; Load 0 in to HL
    LD     (PenCol), HL   ; Set start pt of message at top left
    
    JR Get_NewKey
    
Get_NewKey:
    b_call(_GetKey)
    CP 9
    JR Z, exit 
    
    LD     H, 0         ; Clear H
    LD	   L,A
    b_call(_DispHL)        ; Print String
    b_call(_NewLine)

    JR Get_NewKey
exit:
	RET
.end
.end
