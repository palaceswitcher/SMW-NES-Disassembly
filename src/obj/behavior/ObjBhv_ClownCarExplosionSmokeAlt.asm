.segment "PRG37"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xBA
obj0xBA:
	LDX $A4
	objDistCalc bra_903C

bra_903C:
	LDA objState,X
	CLC
	ADC #$50
	STA $25
	LDA frameCount
	AND #$00
	BNE bra_904F
	LDA $25
	JSR parseMovementData
bra_904F:
	LDX $A4
	LDA objVar,X
	CMP #$0C
	BCC bra_907C_RTS
	LDA objFrameCount
	AND #$07
	BNE bra_907C_RTS
	LDA enemyAnimFrame,X
	AND #$03
	CMP #$03
	BCS bra_906C
	INC enemyAnimFrame,X
	RTS
bra_906C:
	LDA objState,X
	BNE bra_9074
	INC bowserState
bra_9074:
	LDA #$00
	STA objSlot,X
	STA bowserStateTimer
bra_907C_RTS:
	RTS

; Likely unimplemented object
	LDX $A4
	objDistCalc bra_90E3_RTS
	
bra_90E3_RTS:
	RTS
