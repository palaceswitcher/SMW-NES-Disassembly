.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xA4
obj0xA4:
	LDX $A4
	LDA objVar,X
	BMI bra9_9676
	JMP loc9_96DD
bra9_9676:
	objDistCalc bra9_96DA

bra9_96DA:
	JMP objFacePlayer
loc9_96DD:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_9747

bra9_9747:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_975B,Y
	STA $32
	LDA tbl9_975B+1,Y
	STA $33
	JMP ($32)
tbl9_975B:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_9765
	.word objFlipKill
ptr2_9765:
	JSR sub9_978D
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
	JMP loc9_98D1 ; This goes to the throwing dry bones code
sub9_978D:
	LDA frameCount
	AND #$02
	BEQ bra9_9794
	RTS
bra9_9794:
	LDA #$8B
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
