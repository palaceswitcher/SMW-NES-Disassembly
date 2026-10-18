.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x80
obj0x80:
	LDX $A4
	LDA objVar,X
	BMI bra9_8AB4
	JMP loc9_8B27
bra9_8AB4:
	objDistCalc bra9_8B18

bra9_8B18:
	LDA objVar,X
	CMP #$81
	BCS bra9_8B23
	JSR objFacePlayer
	RTS
bra9_8B23:
	JSR sub_54_B4FC
	RTS
loc9_8B27:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra9_8B91

bra9_8B91:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8BA5,Y
	STA $32
	LDA tbl9_8BA5+1,Y
	STA $33
	JMP ($32)
tbl9_8BA5:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_8B8F
	.word objFlipKill
ptr2_8B8F:
	LDA frameCount
	AND #$00
	BEQ bra9_8BB6
	RTS
bra9_8BB6:
	LDA #$80
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR getSpeedData
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	JSR objKillOnSpinJump
	LDA #$10
	STA playerYSpd
	LDA playerMoveFlags
	ORA #$04
	EOR #$01
	STA playerMoveFlags
	LDA #$10
	STA playerXSpd
	LDA #$01
	JSR rewardPoints
	LDA #$12
	STA sndSfx
	LDX $A4
	LDA #$81
	STA objVar,X
	RTS
