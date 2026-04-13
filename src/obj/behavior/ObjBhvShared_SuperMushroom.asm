.segment "PRG53"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export sub7_9149
sub7_9149:
	LDA #$06
	STA $25
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl7_9161,Y
	STA $32
	LDA tbl7_9161+1,Y
	STA $33
	JMP ($32)
tbl7_9161:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr5_916B
	.word ptr5_917C
ptr5_916B:
	JSR jmp_54_A773
	JSR objGetEdiblePowerup
	LDA #$00
	STA objSlot,Y
	LDA #$03
	JSR rewardPoints
	RTS
ptr5_917C:
	LDA objVar,X
	CMP #$0E
	BCS bra7_91A2
	LDA objSlot,X
	CMP #$39
	BNE bra7_9196
	LDA frameCount
	AND #$00
	BNE bra7_9195_RTS
	LDA #$2A
	JSR getMovementData
bra7_9195_RTS:
	RTS
bra7_9196:
	LDA frameCount
	AND #$03
	BNE bra7_91A1_RTS
	LDA #$05
	JSR getMovementData
bra7_91A1_RTS:
	RTS
bra7_91A2:
	LDA objFlags,X
	AND #$E0
	STA objFlags,X
	LDA #$00
	STA objVar,X
	RTS
