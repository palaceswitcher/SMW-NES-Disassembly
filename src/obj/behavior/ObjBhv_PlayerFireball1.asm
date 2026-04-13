.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x06
.proc obj0x06
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA objSlot,X
	BEQ bra7_8E8B ; Clear fireball slot if object is empty
	JSR sub3_B057
	BEQ bra7_8E5B
	CMP #$04
	BEQ bra7_8E5B
	CMP #$02
	BNE bra7_8E7F
bra7_8E5B:
	LDA frameCount
	AND #$00
	BNE bra7_8E66 ; Set speed to once every frame
	LDA #$06
	JSR getMovementData
bra7_8E66:
	LDA #$08
	JSR objObjectHitCheck
	LDA objSlot,X
	CMP #OBJ_MORTONROY
	BEQ bra7_8E7F ; Pop if fireball hits Morton/Roy
	CMP #OBJ_BUZZYBEETLE
	BCS bra7_8E7A
	CMP #OBJ_MECHAKOOPA
	BCS bra7_8E7F
bra7_8E7A:
	LDA #$00
	STA objSlot,X
bra7_8E7F:
	LDY $A4
	LDA #OBJ_POP
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
bra7_8E8B:
	STA fireballSlot
	RTS
.endproc
