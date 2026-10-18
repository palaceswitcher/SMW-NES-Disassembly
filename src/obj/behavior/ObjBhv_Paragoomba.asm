.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xA0
obj0xA0:
	LDX $A4
	LDA objVar,X
	BPL bra9_8153
	JMP objFacePlayer
bra9_8153:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra9_81BD

bra9_81BD:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_81D1,Y
	STA $32
	LDA tbl9_81D1+1,Y
	STA $33
	JMP ($32)
tbl9_81D1:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_81D1
	.word objFlipKill
ptr2_81D1:
	LDX $A4
	LDA objVar,X
	BNE bra9_81FC
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_81EB
	LDY #$40
bra9_81EB:
	STY $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	LDA #$01
	STA objVar,X
bra9_81FC:
	JSR sub9_82AE
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
	LDA #SFX_ENEMYHIT2
	STA sndSfx
	LDX $A4
	LDA objSlot,X
	AND #$01
	ORA #$94
	STA objSlot,X
	LDA #$80
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	CLC
	ADC #$10
	STA objYLo,X
	objDistCalc bra9_82AD_RTS

bra9_82AD_RTS:
	RTS
sub9_82AE:
	LDA objFrameCount
	AND #$02
	BNE bra9_82C6_RTS
	LDA #$89
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_82C6_RTS:
	RTS
