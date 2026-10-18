.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x98
obj0x98:
	LDX $A4
	LDA objVar,X
	BPL bra9_83A4
	objDistCalc bra9_839E

bra9_839E:
	LDA #$00
	STA objVar,X
	RTS
bra9_83A4:
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra9_840E

bra9_840E:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8422,Y

; Broken object that always crashes? Why does this exist
.export obj0x8E
obj0x8E:
	STA $32
	LDA tbl9_8422+1,Y
	STA $33
	JMP ($32)
tbl9_8422:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_842C
	.word objFlipKill
ptr2_842C:
	LDA objXDistHi,X
	EOR #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
	JSR sub9_84FE
	JSR sub3_B077
	BEQ bra9_8448
	JMP loc9_846E
bra9_8448:
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
	JMP loc9_846E
	RTS
loc9_846E:
	LDX $A4
	LDA objSlot,X
	AND #$01
	ORA #$94
	STA objSlot,X
	LDA #$80
	STA objVar,X
	LDA objXLo,X
	CLC
	ADC #$04
	STA objXLo,X
	LDA objXHi,X
	ADC #$00
	STA objXHi,X
	LDA objYLo,X
	CLC
	ADC #$0E
	STA objYLo,X
	objDistCalc bra9_84FD_RTS
	
bra9_84FD_RTS:
	RTS
sub9_84FE:
	LDA objFrameCount
	AND #$0E
	BNE bra9_8516_RTS
	LDA #$86
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8516_RTS:
	RTS
