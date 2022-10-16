.nolist
#include "ti84pcse.inc"
#include "dcse8.inc"
#define    ProgStart  userMem-2

_i .equ $8000
_n .equ 100

.list
.org    ProgStart
.db tExtTok,tAsm84CCmp


	call ClearLCDFull
	b_call(_HomeUp)
	;Load start up message
	ld    HL, 0
    ld    (PenCol), HL
    ld    HL, starting_msg
    b_call(_PutS)
    b_call(_NewLine)
    
    ;Initialisation

    ld A,0
    ld (_i),A
    
    start_for:
		ld A, (_i)
		cp _n; edit _n to decide the when for loop terminates
		jr Z, end_for
		
		inc A
		ld (_i),A
		ld H,0
		ld L,A
		b_call(_DispHL)
		b_call(_NewLine)
		
		jr start_for
	
	;Load end message
	end_for:
		ld    HL, ending_msg
		b_call(_PutS)
		b_call(_NewLine)
    
    wait:
		b_call(_GetKey)		
		
		cp 9		;Exit
		jr Z, exit 
		
		jr wait
	exit:
		ret
    
starting_msg:
    .DB "Innitiate For Loop...",0
ending_msg:
    .DB "End For Loop",0
.end
.end
