.segment "PRG50"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x88
obj0x88:
	LDX $A4
	LDA objVar,X
	BMI bra6_800A
	JMP loc6_809C
bra6_800A:
	objDistCalc bra6_806E

bra6_806E:
	LDA objVar,X
	CMP #$81
	BCS bra6_8078
	JMP objFacePlayer
bra6_8078:
	CMP #OBJ_NINJI
	BCS bra6_807F
	JMP sub_54_B4FC
bra6_807F:
	LDA objFrameCount
	AND #$1E
	BNE bra6_809C
	INC objVar,X
	LDA objVar,X
	AND #$0F
	CMP #$0E
	BCC bra6_809C
	LDA objVar,X
	AND #$70
	ORA #$01
	STA objVar,X
bra6_809C:
loc6_809C:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra6_8106

bra6_8106:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl6_811A,Y
	STA $32
	LDA tbl6_811A+1,Y
	STA $33
	JMP ($32)
tbl6_811A:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr6_8124
	.word objFlipKill
.export ptr6_8124
ptr6_8124:
	LDX $A4
	LDA objVar,X
	BMI bra6_8151
	AND #$0F
	BNE bra6_8139
	LDA objVar,X
	ORA #$88
	STA objVar,X
	BNE bra6_8151
bra6_8139:
	LDA frameCount
	AND #$04
	BEQ bra6_8140
	RTS
bra6_8140:
	LDA #$00
	ASL
	TAY
	LDA tbl6_88D9,Y
	STA $32
	LDA tbl6_88D9+1,Y
	STA $33
	JSR sub3_B485
bra6_8151:
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
	LDA #SFX_ENEMYHIT2
	STA sndSfx
	LDX $A4
	LDA #$81
	STA objVar,X
	RTS
