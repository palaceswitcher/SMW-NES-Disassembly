.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xE6
obj0xE6:
	LDX $A4
	objDistCalc bra5_9C76

bra5_9C76:
	LDA objState,X
	BNE bra5_9C9B
	LDA frameCount
	AND #$00
	BNE bra5_9C86
	LDA #$4A
	JSR parseMovementData
bra5_9C86:
	LDA objVar,X
	AND #$1F
	CMP #$0F
	BCC bra5_9C9A_RTS
	INC objState,X
	LDA #$00
	STA objVar,X
	STA objFlags,X
bra5_9C9A_RTS:
	RTS
bra5_9C9B:
	LDA frameCount
	AND #$00
	BNE bra5_9CA6
	LDA #$0B
	JSR getMovementData
bra5_9CA6:
	LDA objXDistHi,X
	BPL bra5_9CB8
	LDA #$08
	CLC
	ADC #$10
	CLC
	ADC objXDistLo,X
	BCS bra5_9CBF
	BCC bra5_9CDF
bra5_9CB8:
	LDA objXDistLo,X
	CMP #$08
	BCS bra5_9CDF
bra5_9CBF:
	LDA objYDistHi,X
	BEQ bra5_9CD5
	CMP #$FF
	BNE bra5_9CDF
	LDA #$14
	CLC
	ADC #$10
	CLC
	ADC objYDistLo,X
	BCS bra5_9CDC
	BCC bra5_9CDF
bra5_9CD5:
	LDA objYDistLo,X
	CMP #$00
	BCS bra5_9CDF
bra5_9CDC:
	CLC
	BCC bra5_9CE0
bra5_9CDF:
	SEC
bra5_9CE0:
	BCS bra5_9CF3_RTS
	INC playerLives
	LDA #SFX_1UP
	STA sndSfx
	LDA #$00
	STA objSlot,X
	LDA #$03
	JSR rewardPoints
bra5_9CF3_RTS:
	RTS
