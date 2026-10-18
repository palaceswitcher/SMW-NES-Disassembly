.segment "PRG56"

.include "constants.asm"
.include "macros.asm"
.include "variables.asm"

.export obj0x96
obj0x96:
	LDX $A4
	LDA #$06
	STA $25
	LDX $A4
	objDistCalc bra9_8740

bra9_8740:
	LDA objFlags,X
	AND #$1F
	ASL
	TAY
	LDA tbl9_8754,Y
	STA $32
	LDA tbl9_8754+1,Y
	STA $33
	JMP ($32)
tbl9_8754:
	.word objYoshiTongueCheck
	.word ptr_AA7B
	.word objPowerupEatCheck
	.word ptr2_875E
	.word objFlipKill

ptr2_875E:
	LDX $A4
	LDA objVar,X
	BPL bra9_87D7
	JSR sub9_887E
	JSR sub3_B077
	BEQ bra9_87D6_RTS
	LDA #$00
	STA objVar,X
	objDistCalc bra9_87D6_RTS

bra9_87D6_RTS:
	RTS
bra9_87D7:
	CMP #$0D
	BEQ bra9_880C
	CMP #$0F
	BCS bra9_87E5
	JSR sub9_881D
	JMP loc9_87E8
bra9_87E5:
	JSR sub9_8865
loc9_87E8:
	JSR jmp_54_BC3E
	JSR objKillOnSpinJump
	LDX $A4
	LDA objVar,X
	BEQ bra9_880B_RTS
	LDA #$0F
	STA objVar,X
	LDA objXDistHi,X
	AND #$40
	STA $25
	LDA objFlags,X
	AND #$BF
	ORA $25
	STA objFlags,X
bra9_880B_RTS:
	RTS
bra9_880C:
	DEC objSlot,X
	DEC objSlot,X
	JSR objFacePlayer
	LDA #$03
	STA objVar,X
	JMP obj0x94
sub9_881D:
	LDA objFlags,X
	AND #$20
	BEQ bra9_884C
	LDA objFrameCount
	AND #$00
	BNE bra9_883C
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_883C:
	LDA objFlags,X
	AND #$20
	BNE bra9_884B_RTS
	LDA objFlags,X
	AND #$F0
	STA objFlags,X
bra9_884B_RTS:
	RTS
bra9_884C:
	LDA objFrameCount
	AND #$1E
	BNE bra9_8864_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8864_RTS:
	RTS
sub9_8865:
	LDA objFrameCount
	AND #$00
	BNE bra9_887D_RTS
	LDA #$84
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_887D_RTS:
	RTS
sub9_887E:
	LDA objFrameCount
	AND #$00
	BNE bra9_8896_RTS
	LDA #$85
	ASL
	TAY
	LDA tbl9_9C5E,Y
	STA $32
	LDA tbl9_9C5E+1,Y
	STA $33
	JSR sub9_8000
bra9_8896_RTS:
	RTS
