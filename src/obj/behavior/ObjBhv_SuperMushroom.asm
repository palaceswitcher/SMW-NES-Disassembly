.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x0B
obj0x0B:
	LDX $A4
	objDistCalc bra7_912E

bra7_912E:
	JSR jmp_54_BD3D
	JSR sub7_9149
	LDA objFlags,X ; Get the current object state
	AND #%00001111 ; Mask the lower 4 bits out
	CMP #4
	BCS bra7_9148_RTS ; Continue if the result is less than $04
	LDA frameCount
	AND #$01
	BNE bra7_9148_RTS ; Only continue if on an even frame
	LDA #$0B
	JSR getMovementData ; Get the movement data
bra7_9148_RTS:
	RTS
