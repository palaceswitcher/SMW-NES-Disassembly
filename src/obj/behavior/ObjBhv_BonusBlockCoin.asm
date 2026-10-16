.segment "PRG49"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xE7
obj0xE7:
	LDX $A4
	objDistCalc bra5_9A12

bra5_9A12:
	LDA #$03
	STA enemyAnimFrame,X
	LDA objState,X
	ASL
	TAY
	LDA tbl5_9A29,Y
	STA $32
	LDA tbl5_9A29+1,Y
	STA $33
	JMP ($32)
tbl5_9A29:
	.word ptr10_9A2D
	.word ptr10_9A45
ptr10_9A2D:
	LDA frameCount
	AND #$00
	BNE bra5_9A38
	LDA #$49
	JSR parseMovementData
bra5_9A38:
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BNE bra5_9A44_RTS
	INC objState,X
bra5_9A44_RTS:
	RTS
ptr10_9A45:
	LDA #$00
	STA objSlot,X
	RTS
