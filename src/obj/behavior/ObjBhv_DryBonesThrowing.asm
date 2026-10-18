.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0xA2
obj0xA2:
	LDX $A4
	LDA objVar,X
	BMI bra9_97B0
	JMP loc9_9817
bra9_97B0:
	objDistCalc bra9_9814

bra9_9814:
	JMP objFacePlayer
loc9_9817:
	LDA #$07
	STA $25
	LDX $A4
	objDistCalc bra9_9881

bra9_9881:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_9895,Y
	STA $32
	LDA tbl9_9895+1,Y
	STA $33
	JMP ($32)
tbl9_9895:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_989F
	.word objFlipKill
ptr2_989F:
	LDA objVar,X
	CMP #$40
	BCS bra9_98AC
	JSR sub9_98E2
	JMP loc9_98AF
bra9_98AC:
	JSR sub9_991E
loc9_98AF:
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
.export loc9_98D1
loc9_98D1:
	LDX $A4
	LDA objSlot,X
	CLC
	ADC #$06
	STA objSlot,X
	LDA #$00
	STA objVar,X
	RTS
sub9_98E2:
	LDA frameCount
	AND #$02
	BEQ bra9_98E9
	RTS
bra9_98E9:
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
	BEQ bra9_9905
	CMP #$20
	BNE bra9_991D_RTS
bra9_9905:
	LDY #$00
	LDA objXDistHi,X
	BMI bra9_990E
	LDY #$40
bra9_990E:
	STY $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	INC objVar,X
bra9_991D_RTS:
	RTS
sub9_991E:
	LDA frameCount
	AND #$1E
	BEQ bra9_9925
	RTS
bra9_9925:
	LDA #$8A
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR jmp_54_B39B
	LDA objVar,X
	CMP #$46
	BNE bra9_997F_RTS
	INC objVar,X
	LDY objCount
	INC objCount
	LDA objXLo,X
	CLC
	ADC #$08
	STA objXLo,Y
	LDA objXHi,X
	ADC #$00
	STA objXHi,Y
	LDA objYLo,X
	CLC
	ADC #$08
	STA objYLo,Y
	LDA objYHi,X
	ADC #$00
	STA objYHi,Y
	LDA objFlags,X
	AND #$40
	STA objFlags,Y
	LDA #$00
	STA objVar,Y
	STA objState,Y
	LDA objSlot,X
	CLC
	ADC #$04
	STA objSlot,Y
bra9_997F_RTS:
	RTS
