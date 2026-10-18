.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xAA
obj0xAA:
	LDX $A4
	LDA objVar,X
	BMI bra9_90E8
	JMP loc9_914F
bra9_90E8:
	objDistCalc bra9_914C

bra9_914C:
	JMP objFacePlayer
loc9_914F:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_91B9

bra9_91B9:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_91CD,Y
	STA $32
	LDA tbl9_91CD+1,Y
	STA $33
	JMP ($32)
tbl9_91CD:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_91D7
	.word objFlipKill
ptr2_91D7:
	LDA objVar,X
	CMP #$40
	BCS bra9_91E4
	JSR sub9_9224
	JMP loc9_91E7
bra9_91E4:
	JSR sub9_9260
loc9_91E7:
	JSR objCapeHitCheck
	JSR objCollStompOrHurt
	JSR objKillOnSpinJump
	LDA objVar,X
	CMP #$40
	BCS bra9_9221
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
	CLC
	ADC #$02
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
bra9_9221:
	JMP jmp_54_BF74
sub9_9224:
	LDA frameCount
	AND #$02
	BEQ bra9_922B
	RTS
bra9_922B:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDX $A4
	LDA objVar,X
	BEQ bra9_9247
	CMP #$20
	BNE bra9_925F_RTS
bra9_9247:
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_9250
	LDY #$40
bra9_9250:
	STY $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	INC objVar,X
bra9_925F_RTS:
	RTS
sub9_9260:
	LDA frameCount
	AND #$1E
	BEQ bra9_9267
	RTS
bra9_9267:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	RTS
