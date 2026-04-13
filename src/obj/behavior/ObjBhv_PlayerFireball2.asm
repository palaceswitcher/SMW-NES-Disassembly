.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x07
obj0x07:
	LDX $A4
	JSR sub7_8F50
	LDX $A4
	LDA objSlot,X
	BEQ bra7_8ED8
	JSR sub3_B057
	BEQ bra7_8EA8
	CMP #$04
	BEQ bra7_8EA8
	CMP #$02
	BNE bra7_8ECC
bra7_8EA8:
	LDA frameCount
	AND #$00
	BNE bra7_8EB3
	LDA #$06
	JSR getMovementData
bra7_8EB3:
	LDA #$08
	JSR objObjectHitCheck
	LDA objSlot,X
	CMP #$70
	BEQ bra7_8ECC
	CMP #$42
	BCS bra7_8EC7
	CMP #$3A
	BCS bra7_8ECC
bra7_8EC7:
	LDA #$00
	STA objSlot,X
bra7_8ECC:
	LDY $A4
	LDA #$0F
	STA objSlot,Y
	LDA #$00
	STA objFlags,Y
bra7_8ED8:
	STA fireballSlot2
	RTS
