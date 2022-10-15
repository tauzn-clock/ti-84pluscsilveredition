;Moves a character around
.nolist
#include "ti84pcse.inc"
#include "dcse8.inc"

#define    ProgStart  userMem-2
.list
.org    ProgStart
.db tExtTok,tAsm84CCmp

	call ClearLCDFull
	LD     A, 0
    LD     (CurRow), A    ;
    LD     A, 0
    LD     (CurCol), A    
    LD     A, 'I'
	b_call(_PutC)
    

	JR main
	
	main:
		b_call(_GetKey)		
		
		CP 9		;Exit
		JR Z, exit 
		
		CP 1
		JR Z, right
		
		CP 2
		JR Z, left
		
		CP 3
		JR Z, up
		
		CP 4
		JR Z, down
		
		JR main
	right:
		LD A, (CurCol)
		INC A
		LD (CurCol),A
		JR write
	left:
		LD A, (CurCol)
		DEC A
		LD (CurCol),A
		JR write
	up:
		LD A, (CurRow)
		DEC A
		LD (CurRow),A
		JR write
	down:
		LD A, (CurRow)
		INC A
		LD (CurRow),A
		JR write
	write:
		call ClearLCDFull
		LD     A, 'I'
		b_call(_PutC); I think this automatically incrmenet CurCol by one
		LD A, (CurCol)
		DEC A
		LD (CurCol),A
		JR main
	
	exit:
		RET
.end
.end
